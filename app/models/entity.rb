class Entity < ActiveRecord::Base
  has_and_belongs_to_many :interactions

  scope :of_type, ->(entity_type) {
    where(entity_type_id: entity_type.id)
  }
end
