'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'ManageCtrl', ($scope, $http) ->
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