'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'ManageCtrl', ($scope, $location, Spellbook) ->
  #TODO: Service that gets master spell list
  $scope.spellbooks = Spellbook.all()
  $scope.$watchCollection _.throttle(Spellbook.all, 300),
    (val) -> $scope.spellbooks = val
  $scope.addSpellbook = (name) ->
    spellbook = new Spellbook name
    spellbook.save()
    $location.path("spells/#{spellbook.id}")
  $scope.deleteSpellbook = (spellbook) ->
    console.log spellbook
    debugger
    spellbook.delete()