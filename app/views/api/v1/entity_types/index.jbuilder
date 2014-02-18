json.entity_types @entity_types do |entity_type|
  json.partial! 'v1/entity_types/model', entity_type: entity_type
end
