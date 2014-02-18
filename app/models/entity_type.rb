class EntityType < ActiveRecord::Base
  has_many :entities

  has_many :entity_type_interactions
  has_many :interactions,
           through: :entity_type_interactions
end
