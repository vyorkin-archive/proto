class Entity < ActiveRecord::Base
  belongs_to :type,
             class_name: 'EntityType',
             foreign_key: 'entity_type_id'

  has_many :entity_interactions
  has_many :interactions, through: :entity_interactions

  scope :of_type, ->(entity_type) {
    where(entity_type_id: entity_type.id)
  }
end
