class EntityType < ActiveRecord::Base
  has_many :entities
  has_and_belongs_to_many :interactions
end
