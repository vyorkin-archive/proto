class CreatePlayerCharacteristics < ActiveRecord::Migration
  def change
    create_table :player_characteristics do |t|
      t.references :player, null: false, index: true
      t.references :characteristic, null: false, index: true
      t.float :value, null: false, default: 0.0

      t.timestamps
    end

    add_index :player_characteristics,
      [:player_id, :characteristic_id], unique: true
  end
end

