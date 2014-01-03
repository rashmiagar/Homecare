class Feedback < ActiveRecord::Base
	belongs_to :service_transaction
	# belongs_to :labor
	belongs_to :user, :class_name => "Userdetails"
	
	def self.average_rating id
		feedbacks = Feedback.find_all_by_labor_id(id)
		arr = feedbacks.collect {|f| f.rating }
		#p arr.inspect
		if(arr.size >0)
		 return arr.inject{ |sum, el| sum + el }.to_f / arr.size
		end
	else 
		return "None"
	end
	
end