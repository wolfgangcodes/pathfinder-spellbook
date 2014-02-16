'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'AnnotateCtrl', ($scope, $route) ->
  $scope.spellbook = $route.current.locals.spellbook

