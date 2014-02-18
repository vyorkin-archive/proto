require File.expand_path('../../../lib/migration_extensions', __FILE__)

class CreateCharacteristics < ActiveRecord::Migration
  include MigrationExtensions

  def change
    create_table :characteristics do |t|
      t.string :title, null: false
      t.text :description
      t.hstore :attrs, default: {}

      t.timestamps
    end

    add_gin_index :characteristics, :attrs
  end
end
