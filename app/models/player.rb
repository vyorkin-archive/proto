class Player < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :characteristics
  has_many :player_skills
  has_many :skills, through: :player_skills
  has_one :bag
end
