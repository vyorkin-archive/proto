class EnitityTypeInteraction < ActiveRecord::Base
  belongs_to :entity_type
  belongs_to :interaction
end
