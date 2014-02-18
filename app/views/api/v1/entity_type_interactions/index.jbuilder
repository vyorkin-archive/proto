json.entity_type_interactions @entity_type_interactions do |entity_type_interaction|
  json.partial! 'v1/entity_type_interactions/model', entity_type_interaction: entity_type_interaction
end
