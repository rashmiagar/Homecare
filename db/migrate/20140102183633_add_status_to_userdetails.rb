class AddStatusToUserdetails < ActiveRecord::Migration
  def self.up
    add_column :userdetails, :status, :string
  end

  def self.down
    remove_column :userdetails, :status
  end
end
