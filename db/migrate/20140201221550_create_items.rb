require File.expand_path('../../../lib/migration_extensions', __FILE__)

class CreateItems < ActiveRecord::Migration
  include MigrationExtensions

  def change
    create_table :items do |t|
      t.references :item_type, index: true
      t.hstore :attrs, default: {}
      t.decimal :latitude,  precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end

    add_gist_index :items
    add_gin_index  :items, :attrs
  end
end
