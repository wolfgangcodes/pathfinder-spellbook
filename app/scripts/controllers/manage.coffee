'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'ManageCtrl', ($scope, $location, Spellbook, Classes) ->
  #TODO: Service that gets master spell list
  $scope.classes = Classes
  $scope.spellbooks = Spellbook.all()
  $scope.selectedClasses = {}

  $scope.$watchCollection _.throttle(Spellbook.all, 300),
    (val) -> $scope.spellbooks = val

  $scope.addSpellbook = (name) ->
    spellbook = new Spellbook name, $scope.selectedClasses
    spellbook.save()
    $location.path("spells/#{spellbook.id}")
  $scope.deleteSpellbook = (spellbook) -> spellbook.delete()