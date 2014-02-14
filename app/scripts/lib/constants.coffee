'use strict'
constants = angular.module('spellbook.constants', [])

constants.constant 'Domains', []

#TODO: We should maintain one list of classes client and server
constants.constant 'Classes',
  [
    'cleric'
    'druid'
    'ranger'
    'bard'
    'paladin'
    'alchemist'
    'summoner'
    'witch'
    'inquisitor'
    'oracle'
    'antipaladin'
    'magus'
    'sorcerer'
    'wizard'
  ]
