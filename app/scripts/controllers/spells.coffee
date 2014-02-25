'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'SpellsCtrl', ($scope, spellbook, spellCatalog) ->
  $scope.spellbook = spellbook
  $scope.catalog = spellCatalog
  $scope.selectSpell = (spell) ->
    if $scope.spellbook.spells[spell.name]
      delete $scope.spellbook.spells[spell.name]
    else
      $scope.spellbook.spells[spell.name] = true