'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'SpellsCtrl', ($scope, $route) ->
  $scope.spellbook = $route.current.locals.spellbook
