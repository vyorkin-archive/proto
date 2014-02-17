class CreateInteractionsSkills < ActiveRecord::Migration
  def change
    create_table :interactions_skills do |t|
      t.references :skill, index: true
      t.references :interaction, index: true
    end

    add_index :interactions_skills, [:skill_id, :interaction_id],
      unique: true, name: 'players_interaction_skills_unique_index'
  end
end
