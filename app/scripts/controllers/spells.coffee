'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'SpellsCtrl', ($scope, $filter, Classes, spellbook, spellCatalog) ->
  $scope.classes = Classes
  $scope.spellbook = spellbook
  $scope.catalog = $filter('classFilter') spellCatalog, spellbook.classes

  $scope.selectClass = (className) ->
    spellbook.selectClass className
    $scope.catalog = $filter('classFilter') spellCatalog, spellbook.classes

  # $scope.selectSpell = (spell) -> $scope.spellbook.selectSpell spell.name
