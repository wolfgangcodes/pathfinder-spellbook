'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'MainCtrl', ($scope, $http, Classes, Domains, Spells) ->
  $scope.classes = Classes
  $scope.spellsByLevel = _.groupBy Spells, (spell) -> _.min _.filter spell.classes, (c) -> c
  $scope.nameFilter = ''
  $scope.selectedClasses = {}
  $scope.selectedLevel = 0
  $scope.clearSelected = -> _.each $scope.spellsByLevel, (spells) ->  _.each spells, (spell) -> spell.selected = false





