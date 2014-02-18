require File.expand_path('../../../lib/migration_extensions', __FILE__)

class CreateItems < ActiveRecord::Migration
  include MigrationExtensions

  def change
    create_table :items do |t|
      t.references :item_type, index: true
      t.string :title, null: false
      t.text :description
      t.hstore :attrs, default: {}

      t.timestamps
    end

    add_gin_index :items, :attrs
  end
end
