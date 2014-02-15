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
  getSpellbook: getSpellbook = (id) -> storageService.get "#{PREFIX}.#{id}"
  getAllSpellbooks: getAllSpellbooks = -> _.map _.filter( _.keys(localStorage), (key) -> key.indexOf(PREFIX) is 0), (key) -> storageService.get key
  saveSpellbook: saveSpellbook = (spellbook) -> storageService.save "#{PREFIX}.#{spellbook.id}", spellbook

services.factory 'Spellbook', () ->
  generateId = () -> ((Math.floor(Math.random() * Math.pow 10,16)).toString(36) for [0..4]).join('')
  namesGenerated = 1
  generateName = -> "New Spellbook #{namesGenerated++}"
  class Spellbook
    constructor: (@name = generateName(), @spells = [] )  ->
      #TODO: This could be garbage, tighten up!
      if _.isObject @name
        spellbook = @name
        @name = spellbook.name
        @id = spellbook.id
        @spells = spellbook.spells
      else
        @id = generateId()
  Spellbook