class Userdetails < ActiveRecord::Base
	#attr_accessible :password, :username
	has_many :transactions, :class_name => "ServiceTransactions"


	validates_presence_of :username, :password, :email

	validates_confirmation_of :password


	def self.query(criteria, querystring)
		if criteria == "User_name" or criteria == "name"
			Userdetails.all(:select => "id, username, firstname, lastname, birthday, email, phone", :conditions => ["username like ?", "#{querystring}%"])
		elsif criteria == "User_phone" or criteria=="phone"
			Userdetails.all(:conditions => ["phone like ?", "%#{querystring}%"])
		elsif criteria == "User_email" or criteria=="email"
			Userdetails.all(:conditions => ["email like ?", "%#{querystring}%"])
		end
	end
end
