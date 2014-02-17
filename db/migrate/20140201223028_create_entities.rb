require File.expand_path('../../../lib/migration_extensions', __FILE__)

class CreateEntities < ActiveRecord::Migration
  include MigrationExtensions

  def change
    create_table :entities do |t|
      t.references :entity_type, index: true
      t.string :title, null: false
      t.hstore :attrs, default: {}
      t.decimal :latitude,  precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6

      t.timestamps
    end

    add_gist_index :entities
    add_gin_index :entities, :attrs
  end
end
