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
var schools = [
  "conjuration",
  "enchantment",
  "transmutation",
  "abjuration",
  "divination",
  "necromancy",
  "universal",
  "evocation",
  "illusion",
  "transformation",
  "see text",
  //Sub Schools
  "creation",
  "compulsion",
  "polymorph",
  "scrying",
  "glamer",
  "healing",
  "charm",
  "pattern",
  "summoning",
  "teleportation",
  "phantasm",
  "creation or calling",
  "figment",
  "figment, glamer",
  "calling",
  "shadow",
  "light",
  "creation, teleportation"
]

var domains = [
  "luck",
  "tactics",
  "air",
  "chaos",
  "evil",
  "good",
  "law",
  "home",
  "ambush",
  "arcane",
  "scalykind",
  "animal",
  "death",
  "souls",
  "plant",
  "artifice",
  "magic",
  "protection",
  "wards",
  "travel",
  "purity",
  "fate",
  "curse",
  "defense",
  "fur",
  "saurian",
  "war",
  "community",
  "leadership",
  "resolve",
  "divine",
  "glory",
  "seasons",
  "radiation",
  "darkness",
  "liberation",
  "restoration",
  "healing",
  "rage",
  "strength",
  "ferocity",
  "fire",
  "catastrophe",
  "weather",
  "storms",
  "charm",
  "family",
  "daemon",
  "devil",
  "toil",
  "inevitable",
  "nobility",
  "knowledge",
  "language",
  "water",
  "lust",
  "madness",
  "trickery",
  "protean",
  "decay",
  "day",
  "light",
  "repose",
  "ash",
  "destruction",
  "archon",
  "demon",
  "earth",
  "sun",
  "loss",
  "undead",
  "growth",
  "love",
  "revolution",
  "rune",
  "thievery",
  "azata",
  "exploration",
  "feather",
  "trade",
  "dragon",
  "ice",
  "ancestors",
  "honor",
  "metal",
  "heroism",
  "blood",
  "murder",
  "construct",
  "thought",
  "deception",
  "memory",
  "night",
  "nightmare",
  "agathion",
  "freedom",
  "smoke",
  "resurrection",
  "martyr",
  "trap",
  "cloud",
  "oceans",
  "wind",
  "caves",
  "insanity"
]

var SPELL = null
csv()
.from.path(__dirname+'/../../data/spells.csv', { delimiter: ',', escape: '"' })
.on('record', function(row,index){
  if(index === 0 ){
    headers = row
  }
  else{
    SPELL = row
    row = row.map(function(obj){
      if(obj === "NULL")
        return null;
      return obj;
    })
    var spell = _.object(headers, row);
    spell.sorcerer = spell.sor;
    spell.wizard = spell.wiz;
    spell.classes = _.pick(spell, classes)
    // Only send levels.
    _.each(spell.classes, function(val, key){
      if(!!!val){
        delete spell.classes[key];
      }
    });
    if(!spell.short_description){
      //TODO: Fix the split for the spell, Eldritch Conduit, Greater
      spell.short_description = spell.description.split('.')[0] + '.';
    }
    spell.short_description = spell.short_description.trim()
    spell.description = spell.description.trim()
    spells.push(_.pick(spell, ['id', 'classes', 'name', 'short_description', 'description', 'source', 'linktext', 'school', 'subschool', 'descriptor', 'verbal', 'somatic', 'material', 'focus', 'divine_focus', 'deity', 'domain', 'material_costs', 'bloodline', 'patron']) );
  }
});

exports.spells = function(req, res) {
  res.json(spells)
};

exports.zorch = function(req, res) {
  res.json(_.object(headers, SPELL))
};
