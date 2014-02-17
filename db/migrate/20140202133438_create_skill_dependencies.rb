class CreateSkillDependencies < ActiveRecord::Migration
  def change
    create_table :skill_dependencies, id: false do |t|
      t.integer :from_id, null: false
      t.integer :to_id, null: false
    end

    add_index :skill_dependencies, [:from_id, :to_id], unique: true
  end
end
