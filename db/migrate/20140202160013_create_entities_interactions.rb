class CreateEntitiesInteractions < ActiveRecord::Migration
  def change
    create_table :entities_interactions do |t|
      t.references :entity, index: true
      t.string :title, null: false
    end
  end
end
