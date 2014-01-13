'use strict'

SpellBook = angular.module('spellbook.app')

SpellBookConstants = angular.module('spellbook.constants', [])
SpellBookConstants.constant 'Domains', []
#TODO: We should maintain one list of classes client and server
SpellBookConstants.constant 'Classes',
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

# directive
# float: right;
# top: 0.65em;
# position: absolute;
# right: 5px;

filters = angular.module('spellbook.filters', ['spellbook.constants'])

filters.filter 'classFilter', ->
  (data, selected) ->
    if _.isEmpty(_.filter selected, (val) -> val)
      data
    else
      _.filter data, (spell) ->
        things = _.filter spell.classes, (spellLevel, className) ->
          spellLevel and selected[className] is not null
        things.length

SpellBook.controller 'MainCtrl', ($scope, $http, Classes, Domains, Spells) ->
  $scope.classes = Classes
  $scope.spellsByLevel = _.groupBy Spells, (spell) -> _.min _.filter spell.classes, (c) -> c
  $scope.nameFilter = ''
  $scope.selectedClasses = {}
  $scope.selectedLevel = 0
  $scope.clearSelected = -> _.each $scope.spellsByLevel, (spells) ->  _.each spells, (spell) -> spell.selected = false




# Clear in search
# Deselect classes
# Search by doamin
# Filter by race
# Class badges








