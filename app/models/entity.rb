class Entity < ActiveRecord::Base
  belongs_to :type, class_name: 'EntityType',
             foreign_key: 'entity_type_id'

  scope :of_type, ->(entity_type) {
    where(entity_type_id: entity_type.id)
  }
end
