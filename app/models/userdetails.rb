class Userdetails < ActiveRecord::Base
	#attr_accessible :password, :username
	has_many :service_transactions

	validates_presence_of :username, :password, :email

	validates_confirmation_of :password


	def self.query(criteria, querystring)
		if criteria == "name"
			Userdetails.all(:select => "id, username, firstname, lastname, birthday, email, phone", :conditions => ["username like ?", "#{querystring}%"])
		else
			Userdetails.all(:conditions => ["#{criteria} like ?", "%#{querystring}%"])
		end
	end
end
