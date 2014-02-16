'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'PrintCtrl', ($scope, $route) ->
  $scope.spellbook = $route.current.locals.spellbook

