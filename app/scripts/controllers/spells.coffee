'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'SpellsCtrl', ($scope, spellbook) ->
  $scope.spellbook = spellbook