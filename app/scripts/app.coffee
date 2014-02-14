'use strict'

spellbook = angular.module 'spellbook.app', [
  # 'ngAnimate',
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',
  'ui.bootstrap',
  'spellbook.constants',
  'spellbook.filters'
]

spellbook.config ($routeProvider, $locationProvider) ->
  $routeProvider
    # .when '/nav',
    #   templateUrl: 'partials/nav'
    #   controller: 'NavCtrl'
    .when '/print',
      templateUrl: 'partials/print'
      controller: 'PrintCtrl'
    .when '/annotate',
      templateUrl: 'partials/annotate'
      controller: 'AnnotateCtrl'
    .when '/manage',
      templateUrl: 'partials/manage'
      controller: 'ManageCtrl'
    .when '/spells',
      templateUrl: 'partials/spells'
      controller: 'SpellsCtrl'
    .when '/old',
      templateUrl: 'partials/old'
      controller: 'MainCtrl'
      resolve:
        Spells: ($http, $q) ->
          deferred = $q.defer()
          $http.get('/api/spells').success (response) -> deferred.resolve response
          deferred.promise
    .otherwise
      redirectTo: '/manage'
  $locationProvider.html5Mode(true)