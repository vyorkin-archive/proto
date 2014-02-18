class CreatePlayerSkills < ActiveRecord::Migration
  def change
    create_table :player_skills do |t|
      t.references :player, null: false, index: true
      t.references :skill, null: false, index: true
      t.timestamp :last_used_at

      t.timestamps
    end

    add_index :player_skills, [:player_id, :skill_id], unique: true
  end
end
