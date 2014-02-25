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
  resolveSpellbook = ($route, $location, Spellbook) ->
    spellbook = Spellbook.get $route.current.params.id
    unless spellbook
      $location.path('/manage')
    spellbook

  $routeProvider
    .when '/manage/:id?',
      templateUrl: 'partials/manage'
      controller: 'ManageCtrl'
      resolve:
        spellbook: resolveSpellbook
        page: -> 'manage'
    .when '/spells/:id?',
      templateUrl: 'partials/spells'
      controller: 'SpellsCtrl'
      resolve:
        spellbook: resolveSpellbook
        page: -> 'spells'
    .when '/annotate/:id',
      templateUrl: 'partials/annotate'
      controller: 'AnnotateCtrl'
      resolve:
        spellbook: resolveSpellbook
        page: -> 'annotate'
    .when '/print/:id',
      templateUrl: 'partials/print'
      controller: 'PrintCtrl'
      resolve:
        spellbook: resolveSpellbook
        page: -> 'print'
    .when '/old',
      templateUrl: 'partials/old'
      controller: 'MainCtrl'
      resolve:
        Spells: (Spells) -> Spells.all()
    .otherwise
      redirectTo: '/manage'
  $locationProvider.html5Mode(true)