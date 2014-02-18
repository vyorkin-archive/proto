class CreateSkillDependencies < ActiveRecord::Migration
  def change
    create_table :skill_dependencies do |t|
      t.integer :from_id, null: false, index: true
      t.integer :to_id, null: false, index: true
    end

    add_index :skill_dependencies, [:from_id, :to_id], unique: true
  end
end
