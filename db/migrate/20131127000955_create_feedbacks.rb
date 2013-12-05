class CreateFeedbacks < ActiveRecord::Migration
  def self.up
  	create_table :feedback do |t|
      t.datetime :date
      t.integer :labor_id
      t.integer :user_id
      t.integer :transaction_id
      t.string :feedback
      t.integer :rating
    end
  end

  def self.down
  	drop_table :feedback
  end
end
