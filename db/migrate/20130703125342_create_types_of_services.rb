class CreateTypesOfServices < ActiveRecord::Migration
  def self.up
    create_table :types_of_services do |t|
		t.string :service_name
      t.timestamps
    end
  end

  def self.down
    drop_table :types_of_services
  end
end