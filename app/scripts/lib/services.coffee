'use strict'

services = angular.module('spellbook.services', [])

services.factory 'SpellbookService', (Spellbook) ->
  all: (new Spellbook() for [1..10])

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