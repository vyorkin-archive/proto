class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :nick

      t.timestamps
    end
  end
end
