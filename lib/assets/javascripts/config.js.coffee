angular.module('mapEditor.services', []).value('config', {
  apiUrl: (url) -> '/api/v1/' + url,
  messages:
    default: 'Уплывай на юг'
  errors:
    default: 'Что-то наебнулось'
})
