'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'ManageCtrl', ($scope, $http) ->
  #TODO: Spellbook resource that we can instantiate
  #TODO: Service that holds current Spellbook
  #TODO: Service that gets master spell list
  #TODO: Should be a service that grabs these from local storage
  $scope.spellbooks = [
    id: 33
    name: "Gnomie's Spellbook"
    spells: []
  ,
    id: 42
    name: "Other Spellbook"
    spells: []
  ,
    id: 1
    name: "Wordup's Spellbook"
    spells: []
  ]