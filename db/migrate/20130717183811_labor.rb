class Labor < ActiveRecord::Migration
  def self.up
  	create_table :labors do |t|
  		t.references :types_of_service
  		t.string :labor_name 
  		t.string :address
  		t.integer :phone
  		t.decimal :charges, :scale => 2
  		t.string :status
  	end
  end

  def self.down
  	 drop_table :labors
  end
end
