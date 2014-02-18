class CreateSkillsInteractions < ActiveRecord::Migration
  def change
    create_table :skills_interactions do |t|
      t.references :skill, null: false, index: true
      t.references :interaction, null: false, index: true
    end

    add_index :skills_interactions, [:skill_id, :interaction_id],
      unique: true, name: 'skills_interactions_unique_index'
  end
end
