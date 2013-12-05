class AddDetailsToUserdetails < ActiveRecord::Migration
  def self.up
    add_column :userdetails, :firstname, :string
    add_column :userdetails, :lastname, :string
    add_column :userdetails, :birthday, :date
    add_column :userdetails, :email, :string
    add_column :userdetails, :phone, :string
  end

  def self.down
    remove_column :userdetails, :phone
    remove_column :userdetails, :email
    remove_column :userdetails, :birthday
    remove_column :userdetails, :lastname
    remove_column :userdetails, :firstname
  end
end
