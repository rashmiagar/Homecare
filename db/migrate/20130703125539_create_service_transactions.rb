class CreateServiceTransactions < ActiveRecord::Migration
  def self.up
    create_table :service_transactions do |t|
    	t.integer :transaction_id
    	t.integer :service_id
    	t.integer :user_id
    	t.integer :labor_id
    	t.string :address
    	t.string :description
    	t.string :status #pending/in-progess/completed
    	t.date :date
    	t.datetime :time

      t.timestamps
    end
  end

  def self.down
    drop_table :service_transactions
  end
end
