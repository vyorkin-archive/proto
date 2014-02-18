class Skill < ActiveRecord::Base
  has_many :skill_interactions
  has_many :interactions, through: :skill_interactions

  has_many :player_skills
  has_many :players, through: :player_skills

  has_and_belongs_to_many :required,
    join_table: 'skill_dependencies',
    foreign_key: 'to_id',
    association_foreign_key: 'from_id',
    class_name: 'Skill',
    readonly: true
end
