'use strict'

SpellBook = angular.module('spellbook.app')

SpellBookConstants = angular.module('spellbook.constants', [])
SpellBookConstants.constant 'Domains', () -> {}
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

filters = angular.module('spellbook.filters', ['spellbook.constants'])

filters.filter 'classFilter', ->
  (data, selected) ->
    console.log data, selected
    data


SpellBook.controller 'MainCtrl', ($scope, $http, Classes, Domains, Spells) ->
  console.log Classes
  $scope.classes = Classes
  $scope.spells = Spells
  $scope.nameFilter = ''
  $scope.selectedClasses = {}













