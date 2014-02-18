require File.expand_path('../../../lib/migration_extensions', __FILE__)

class CreateItemTypes < ActiveRecord::Migration
  include MigrationExtensions

  def change
    create_table :item_types do |t|
      t.string :name, null: false
      t.text :description
      t.hstore :attrs, default: {}

      t.timestamps
    end

    add_gin_index :item_types, :attrs
  end
end
