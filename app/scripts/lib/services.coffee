'use strict'

services = angular.module('spellbook.services', [])

services.factory 'storageService', ->
  get: (key) ->
    angular.fromJson localStorage.getItem key
  save: (key, data) ->
    localStorage.setItem key, angular.toJson data
  remove: (key) ->
    localStorage.removeItem key
  clearAll: () ->
    localStorage.clear()

services.factory 'SpellbookService', (Spellbook, storageService) ->
  PREFIX = "spellbook"
  # SpellbookService =
  getAllSpellbooks: getAllSpellbooks = -> _.map _.filter( _.keys(localStorage), (key) -> key.indexOf(PREFIX) is 0), (key) -> storageService.get key
  saveSpellbook: saveSpellbook = (spellbook) -> storageService.save "#{PREFIX}.#{spellbook.id}", spellbook
  all: getAllSpellbooks()
  # storageService.clearAll()
  # (saveSpellbook new Spellbook() ) for [1..10]
  # SpellbookService

services.factory 'Spellbook', () ->
  idsGenerated = 0
  generateId = -> "spb-#{idsGenerated++}"
  namesGenerated = 1
  generateName = -> "New Spellbook #{namesGenerated++}"
  class Spellbook
    constructor: (@id = generateId(), @name = generateName(), @spells = [] )  ->
      #TODO: This could be garbage, tighten up!
      if arguments.length is 1 and _.isObject @id
        spellbook = @id
        @name = spellbook.name
        @id = spellbook.id
        @spells = spellbook.spells
  Spellbook