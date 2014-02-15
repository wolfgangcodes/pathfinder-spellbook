'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'ManageCtrl', ($scope, $http, SpellbookService, Spellbook) ->
  #TODO: Service that holds current Spellbook
  #TODO: Service that gets master spell list
  $scope.spellbooks = SpellbookService.getAllSpellbooks()
  $scope.$watchCollection _.throttle(SpellbookService.getAllSpellbooks, 1000)
  , (val) -> $scope.spellbooks  = val
  $scope.addSpellbook = (name) ->
    spellbook = new Spellbook name
    SpellbookService.saveSpellbook spellbook