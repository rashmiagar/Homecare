class Labor < ActiveRecord::Base
	belongs_to :service, :class_name => "TypesOfService", :foreign_key => "types_of_service_id"
	has_many :transactions, :class_name => "ServiceTransactions"
	
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

	def self.getname(id)
		labor = Labor.find_by_id(id) 
		unless labor.blank?
			return labor.labor_name
		end
	end
end