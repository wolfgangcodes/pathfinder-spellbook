'use strict'

SpellBook = angular.module('spellbookApp')

SpellBook.constant 'Domains', () -> {}
SpellBook.constant 'Classes', () ->
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

SpellBook.controller 'MainCtrl', ($scope, $http, Classes, Domains, Spells) ->
  $scope.classes = Classes
  $scope.spells = Spells
  $scope.nameFilter = ''
  $scope.classFilter = {}













