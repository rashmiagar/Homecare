class Userdetails < ActiveRecord::Base
	#attr_accessible :password, :username
	validates_presence_of :username, :password, :email

	validates_confirmation_of :password

end
