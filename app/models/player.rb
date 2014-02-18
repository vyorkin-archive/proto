class Player < ActiveRecord::Base
  belongs_to :user

  has_many :player_characteristics
  has_many :characteristics, through: :player_characteristics

  has_many :player_skills
  has_many :skills, through: :player_skills
end
