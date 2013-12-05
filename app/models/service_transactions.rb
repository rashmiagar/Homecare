class ServiceTransactions < ActiveRecord::Base
	validates_presence_of :transaction_id


	def self.generate_trans_id
		#d = Date.today
		d=Time.now
		#@transaction_id = d.to_time.to_i
		@transaction_id = d.to_i
	end
end
