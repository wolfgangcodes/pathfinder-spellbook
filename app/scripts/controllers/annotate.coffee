'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'AnnotateCtrl', ($scope, spellbook) ->
  $scope.spellbook = spellbook

