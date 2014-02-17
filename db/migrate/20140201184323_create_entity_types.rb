require File.expand_path('../../../lib/migration_extensions', __FILE__)

class CreateEntityTypes < ActiveRecord::Migration
  include MigrationExtensions

  def change
    create_table :entity_types do |t|
      t.string :name, null: false
      t.hstore :attrs, default: {}
      t.text :description

      t.timestamps
    end

    add_gin_index :entity_types, :attrs
  end
end
