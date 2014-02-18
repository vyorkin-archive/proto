json.entities @entities do |entity|
  json.partial! 'v1/entities/model', entity: entity
end
