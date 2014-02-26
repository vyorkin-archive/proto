#= require_tree .
#= require_self

mapEditor = angular.module('mapEditor', [
  'ngResource', 'ui.bootstrap',
  'mapEditor.services',
  'mapEditor.directives',
  'mapEditor.filters',
  'mapEditor.controllers'
])

mapEditor.config(['$httpProvider', ($httpProvider) ->
  authToken = $('meta[name="csrf-token"]').attr('content')
  $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken
])

$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstap(this, [module])
