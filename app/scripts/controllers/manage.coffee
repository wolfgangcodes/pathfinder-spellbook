'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'ManageCtrl', ($scope, $http, SpellbookService) ->
  #TODO: Spellbook resource that we can instantiate
  #TODO: Service that holds current Spellbook
  #TODO: Service that gets master spell list
  $scope.spellbooks = SpellbookService.all
