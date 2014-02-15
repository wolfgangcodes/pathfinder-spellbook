'use strict'

spellbook = angular.module 'spellbook.app', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ui.bootstrap',
  'spellbook.constants',
  'spellbook.services',
  'spellbook.filters'
]

spellbook.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/manage',
      templateUrl: 'partials/manage'
      controller: 'ManageCtrl'
      resolve:
        page: -> 'manage'
    .when '/spells/:id',
      templateUrl: 'partials/spells'
      controller: 'SpellsCtrl'
      resolve:
        page: -> 'spells'
    .when '/annotate/:id',
      templateUrl: 'partials/annotate'
      controller: 'AnnotateCtrl'
      resolve:
        page: -> 'spells'
    .when '/print/:id',
      templateUrl: 'partials/print'
      controller: 'PrintCtrl'
      resolve:
        page: -> 'spells'
    .when '/old',
      templateUrl: 'partials/old'
      controller: 'MainCtrl'
      resolve:
        # TODO: This should be a service
        Spells: ($http, $q) ->
          deferred = $q.defer()
          $http.get('/api/spells').success (response) -> deferred.resolve response
          deferred.promise
    .otherwise
      redirectTo: '/manage'
  $locationProvider.html5Mode(true)