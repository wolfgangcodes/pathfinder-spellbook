'use strict'

SpellBook = angular.module('spellbookApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ui.bootstrap'
])

SpellBook.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'partials/main'
      controller: 'MainCtrl'
      resolve:
        Spells: ($http, $q) ->
          #TODO: This should be in a Spells Service
          deferred = $q.defer()
          $http.get('/api/spells').success (response) ->
            deferred.resolve response
          deferred.promise
    .otherwise
      redirectTo: '/'
  $locationProvider.html5Mode(true)