class Characteristic < ActiveRecord::Base
  has_many :player_characteristics
  has_many :players, through: :player_characterstics
end
