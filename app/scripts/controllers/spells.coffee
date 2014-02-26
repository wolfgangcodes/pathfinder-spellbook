'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'SpellsCtrl', ($scope, $filter, Classes, Spells, spellbook) ->
  filterSpellbook = ->
    $filter('spellbookFilter') Spells, spellbook.classes, $scope.levelFilter

  $scope.Classes = Classes
  $scope.Spells = Spells
  $scope.spellbook = spellbook
  $scope.catalog = filterSpellbook()
  $scope.levelFilter = {"0":true}

  # $scope.allOrNone = true
  $scope.selectAllLevels = ->
    $scope.selectLevel(lvl, true) for lvl in [0..9]

  $scope.selectLevel = (lvl, value) ->
      if value is true or $scope.levelFilter[lvl] is undefined
         $scope.levelFilter[lvl] = true
      else
        delete $scope.levelFilter[lvl]
      $scope.catalog = filterSpellbook()

  $scope.selectClass = (className) ->
    spellbook.selectClass className
    $scope.catalog = filterSpellbook()

  # $scope.selectSpell = (spell) -> $scope.spellbook.selectSpell spell.name
