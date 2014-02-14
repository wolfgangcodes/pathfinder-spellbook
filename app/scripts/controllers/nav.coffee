'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'NavCtrl', ($scope, $http, $location) ->
  # TODO: This should be in constants?
  $scope.pages = [
    href: 'manage'
    label: 'Manage'
    icon: 'glyphicon glyphicon-asterisk'
  ,
    href: 'spells'
    label: 'Spellbook'
    icon: 'glyphicon glyphicon-asterisk'
  ,
    href: 'annotate'
    label: 'Annotate'
    icon: 'glyphicon glyphicon-asterisk'
  ,
    href: 'print'
    label: 'Print'
    icon: 'glyphicon glyphicon-asterisk'
  ]
  $scope.currentPage = $scope.pages[0]
  #TODO: this should set the active page by looking at the route. Maybe a watch in Nav?
  $scope.setCurrentPage = (page) -> $scope.currentPage = page


# Clear in search
# Deselect classes
# Search by doamin/subschool
# Filter by race??
# Class badges

# Localstorage for spellbooks
#localStorage.setItem("foo", angular.toJson(foo))





