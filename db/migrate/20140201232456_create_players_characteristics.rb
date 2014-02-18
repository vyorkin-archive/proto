class CreatePlayersCharacteristics < ActiveRecord::Migration
  def change
    create_table :players_characteristics, id: false do |t|
      t.references :player, null: false, index: true
      t.references :characteristic, null: false, index: true
    end

    add_index :players_characteristics, [:player_id, :characteristic_id],
      unique: true, name: 'players_characteristics_unique_index'
  end
end
