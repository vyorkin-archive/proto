class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
