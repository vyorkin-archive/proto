class Interaction < ActiveRecord::Base
  has_and_belongs_to_many :entities
  has_and_belongs_to_many :entity_types
end
