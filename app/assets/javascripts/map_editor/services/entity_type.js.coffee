angular.module('mapEditor.services', [])
.service 'EntityType', -> (config, $http)
  class EntityType
    constructor: ->
      @all = []

    get: (params) ->
      $http.get(config.apiUrl('entity_types')).success((data) ->
        @all.length = 0
        data.entity_types.forEarch((et) -> @all.push(et))
      )
