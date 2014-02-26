'use strict'

SpellBook = angular.module('spellbook.app')

SpellBook.controller 'NavCtrl', ($scope, $route) ->
  # TODO: This should be in constants? or should we get this from routes?
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

  pagesByName = _.object _.pluck($scope.pages, 'href'), $scope.pages
  $scope.currentPage = $scope.pages[0]
  $scope.currentSpellbook = null

  $scope.$on '$routeChangeSuccess', (event, current, previous) ->
    $scope.currentPage = pagesByName[current.locals.page]
    $scope.currentSpellbook = current?.locals?.spellbook or previous?.locals?.spellbook

  # Is this a performance issue?
  # perhaps watchCollection on keys?
  # Just save every second?
  $scope.$watch 'currentSpellbook',
    ->
      $scope.currentSpellbook?.save()
    , true

# Clear in search
# Deselect classes
# Search by doamin/subschool
# Filter by race??
# Class badges
