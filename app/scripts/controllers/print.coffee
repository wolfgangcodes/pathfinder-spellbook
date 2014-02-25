'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'PrintCtrl', ($scope, spellbook) ->
  $scope.spellbook = spellbook

