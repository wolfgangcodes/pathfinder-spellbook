'use strict'

filters = angular.module 'spellbook.filters', []

filters.filter 'spellbookFilter', -> (data, classes = {}, levels = {}) ->
  console.log "-->", classes, levels
  classes = _.keys classes
  levels = _.keys levels
  if _.isEmpty(classes) and _.isEmpty(levels)
    data
  else
    # _.filter data[0..50], (spell) ->
    _.filter data, (spell) ->
      matchedClasses = if _.isEmpty classes then spell.classes else _.pick spell.classes, classes
      hasClass = not _.isEmpty matchedClasses
      console.log _.values(matchedClasses), levels
      hasLevel = if _.isEmpty levels then true else not _.isEmpty _.intersection _.values(matchedClasses), levels
      hasClass and hasLevel
    # if any classes are selected AND
    #   level is not null OR level if levels is not empty, it's one of those.