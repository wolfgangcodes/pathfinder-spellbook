'use strict'

filters = angular.module 'spellbook.filters', []

filters.filter 'classFilter', -> (data, selected) ->
  if _.isEmpty(_.filter selected, (val) -> val)
    data
  else
    _.filter data, (spell) ->
      things = _.filter spell.classes, (spellLevel, className) ->
        spellLevel and selected[className] is not null
      things.length
