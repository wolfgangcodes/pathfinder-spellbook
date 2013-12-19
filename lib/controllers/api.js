'use strict';
var fs = require('fs');
var csv = require('csv');
var _ = require('underscore')
var spells = []
var headers = []
csv()
.from.path(__dirname+'/../../data/spells.csv', { delimiter: ',', escape: '"' })
.on('record', function(row,index){
  if(index === 0 ){
    headers = row
  }
  else{
    row = row.map(function(obj){
      if(obj === "NULL")
        return null;
      return obj;
    })
    var spell = _.object(headers, row);
    spell.sorcerer = spell.sor;
    spell.wizard = spell.wiz;
    if(!spell.short_description){
      //TODO: Fix the split for this spell
      //Eldritch Conduit, Greater
      //This spell functions like eldritch conduit save for the differences listed above and that the target must be within medium range (100 ft. + 10 ft./level) in order for you to use the conduit. Using a creature as a conduit for a spell ends the greater eldritch conduit effect on that creature, but does not end the effect for other eldritch conduits..
      spell.short_description = spell.description.split('.')[0] + '.';
    }
    spells.push(_.omit(spell, ['description_formated', 'full_text', 'linktext', 'sor', 'wiz']) );
  }
});

exports.spells = function(req, res) {
  res.json(spells)
};
