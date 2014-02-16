'use strict'

services = angular.module('spellbook.services', [])

services.factory 'storageService', ->
  get: get = (key) ->
    angular.fromJson localStorage.getItem key
  getAll: (prefix) ->
    _.map _.filter( _.keys(localStorage), (key) -> key.indexOf(prefix) is 0), (key) -> get key
  save: (key, data) ->
    localStorage.setItem key, angular.toJson data
  remove: (key) ->
    localStorage.removeItem key
  clearAll: () ->
    localStorage.clear()

services.factory 'Spellbook', (storageService, Classes) ->
  PREFIX = "spellbook"
  generateId = () -> ((Math.floor(Math.random() * Math.pow 10,16)).toString(36) for [0..4]).join('')
  namesGenerated = 1
  generateName = -> "New Spellbook #{namesGenerated++}"
  class Spellbook
    constructor: (@name = generateName(), @classes = {}, @spells = [])  ->
      #TODO: This could be garbage, tighten up!
      if _.isObject @name
        spellbook = @name
        @name = spellbook.name
        @id = spellbook.id
        @spells = spellbook.spells
        @classes = spellbook.classes
      else
        @id = generateId()
    delete: () -> storageService.remove "#{PREFIX}.#{@id}"
    save: () -> storageService.save "#{PREFIX}.#{@id}", @
    @all = -> _.map storageService.getAll(PREFIX), (object) -> new Spellbook object
    @get = (id) ->
      object = storageService.get "#{PREFIX}.#{id}"
      new Spellbook object if object
  Spellbook