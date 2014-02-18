require File.expand_path('../../../lib/migration_extensions', __FILE__)

class CreatePlayers < ActiveRecord::Migration
  include MigrationExtensions

  def change
    create_table :players do |t|
      t.references :user, index: true
      t.decimal :latitude,  precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end

    add_gist_index :players
  end
end
