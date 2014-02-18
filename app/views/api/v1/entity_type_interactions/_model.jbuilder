json.extract! entity_type_interaction, :id
json.entity_type do
  json.partial! 'v1/entity_types/model', entity_type: entity_type_interaction.entity_type
end
json.interaction do
  json.partial! 'v1/interactions/model', interaction: entity_type_interaction.interaction
end
