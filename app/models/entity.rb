class Entity < ActiveRecord::Base
  has_and_belongs_to_many :interactions
end
