class ServiceTransactions < ActiveRecord::Base
	validates_presence_of :transaction_id
	has_many :types_of_services
	has_many :userdetails
	has_many :labors

	def self.generate_trans_id
		#d = Date.today
		d=Time.now
		#@transaction_id = d.to_time.to_i
		@transaction_id = d.to_i
	end

	def self.query criteria, querystring
		if criteria == "Request_request id"
			ServiceTransactions.all(:conditions => ["transaction_id like ?", "#{querystring}%"])
		elsif criteria == "Request_service"
			#ServiceTransactions.all(:conditions => ["types_of_services.service_name LIKE ?",  "%#{querystring}%"], :joins =>[:types_of_services])
			ServiceTransactions.all(:conditions => ["types_of_services.service_name LIKE ?",  "#{querystring}%"], 
				:select => (ServiceTransactions.column_names-['id','created_at', 'updated_at']).join(', '),:joins =>"INNER JOIN types_of_services on types_of_services.id = service_transactions.service_id")
	
		elsif criteria == 'Request_status'
			ServiceTransactions.all(:conditions => ["status=?", querystring])
		elsif criteria == 'Request_username'
			ServiceTransactions.all(:conditions => ["phone like ?", "%#{querystring}%"])
		end

	end
end
