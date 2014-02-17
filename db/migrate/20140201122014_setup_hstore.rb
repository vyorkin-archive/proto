class SetupHstore < ActiveRecord::Migration
  def self.up
    enable_extension :hstore
    enable_extension :postgis
  end

  def self.down
    disable_extension :postgis
    disable_extension :hstore
  end
end
