class AddUserdetails < ActiveRecord::Migration
  def self.up
    create_table :userdetails do |t|
      t.string :username
      t.string :password
    end
  end

  def self.down
  end
end
