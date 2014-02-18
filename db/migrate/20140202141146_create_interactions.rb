class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
