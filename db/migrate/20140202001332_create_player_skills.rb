class CreatePlayerSkills < ActiveRecord::Migration
  def change
    create_table :player_skills do |t|
      t.references :player, null: false
      t.references :skill, null: false
      t.timestamp :last_user_at

      t.timestamps
    end

    add_index :player_skills, [:player_id, :skill_id], unique: true
  end
end
