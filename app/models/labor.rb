class Labor < ActiveRecord::Base
	belongs_to :types_of_service
	belongs_to :service_transaction
	
	def self.query criteria, querystring
		if criteria == "Labourer_name"
			Labor.all(:conditions => ["labor_name like ?", "#{querystring}%"])
		elsif criteria == "Labourer_city"
			Labor.all(:conditions => ["address like ?", "%#{querystring}%"])
		elsif criteria == 'Labourer_status'
			Labor.all(:conditions => ["status=?", querystring])
		elsif criteria == 'Labourer_phone'
			Labor.all(:conditions => ["phone like ?", "%#{querystring}%"])
		end

	end
end