class PlayerCharacteristic < ActiveRecord::Base
  belongs_to :player
  belongs_to :characteristic
end
