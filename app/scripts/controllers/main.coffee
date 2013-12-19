'use strict'

angular.module('spellbookApp').controller 'MainCtrl', ($scope, $http) ->
  $http.get('/api/spells').success (response) ->
    $scope.spells = response
  $scope.nameFilter = ''
  $scope.classes = [
    'cleric'
    'druid'
    'ranger'
    'bard'
    'paladin'
    'alchemist'
    'summoner'
    'witch'
    'inquisitor'
    'oracle'
    'antipaladin'
    'magus'
    'sorcerer'
    'wizard'
  ]
  $scope.classFilter = {}













