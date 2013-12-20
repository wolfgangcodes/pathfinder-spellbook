'use strict';
var fs = require('fs');
var csv = require('csv');
var _ = require('underscore')
var spells = []
var headers = []
var classes =  [
    'cleric',
    'druid',
    'ranger',
    'bard',
    'paladin',
    'alchemist',
    'summoner',
    'witch',
    'inquisitor',
    'oracle',
    'antipaladin',
    'magus',
    'sorcerer',
    'wizard'
  ]
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
    spell.classes = _.pick(spell, classes)
    if(!spell.short_description){
      //TODO: Fix the split for the spell, Eldritch Conduit, Greater
      spell.short_description = spell.description.split('.')[0] + '.';
    }
    spell.short_description = spell.short_description.trim()
    spell.description = spell.description.trim()
    spells.push(_.pick(spell, ['id', 'classes', 'name', 'short_description', 'description', 'source', 'linktext']) );
  }
});

exports.spells = function(req, res) {
  res.json(spells)
};
