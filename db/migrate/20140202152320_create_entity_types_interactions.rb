class CreateEntityTypesInteractions < ActiveRecord::Migration
  def change
    create_table :entity_types_interactions, id: false do |t|
      t.references :entity_type, null: false
      t.references :interaction, null: false
    end

    add_index :entity_types_interactions, [:entity_type_id, :interaction_id],
      unique: true, name: 'entity_types_interactions_unqiue_index'
  end
end
