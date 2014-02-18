class Interaction < ActiveRecord::Base
  has_many :entity_type_interactions
  has_many :entity_types, through: :entity_type_interactions

  has_many :skill_interactions
  has_many :skills, through: :skill_interactions
end
