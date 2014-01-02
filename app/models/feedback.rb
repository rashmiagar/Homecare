class Feedback < ActiveRecord::Base
	belongs_to :service_transaction
	# belongs_to :labor
	belongs_to :user, :class_name => "Userdetails"
	
	
end