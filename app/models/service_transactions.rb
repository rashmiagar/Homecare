class ServiceTransactions < ActiveRecord::Base
	validates_presence_of :transaction_id
	belongs_to :service, :class_name => "TypesOfService", :foreign_key => "service_id", :dependent => :destroy
	belongs_to :user, :class_name => "Userdetails", :foreign_key => "user_id", :dependent => :destroy  # with this we can do ServiceTransactions.first.user
	belongs_to :labor

	validates_presence_of :service_id, :date, :time, :description, :address, :on => :create
	validate :check_time, :on => :create


	def check_time

		if time && (time.hour < 8 || time.hour > 20)
			errors.add(:time, "has to be between 8 AM and 8 PM")
		end
	end


	def check_date

		if date && (date.year < Date.today.year)
			errors.add(:date, "cannot be in the past")
		end
	end

	def self.generate_trans_id
		#d = Date.today
		d=Time.now
		#@transaction_id = d.to_time.to_i
		@transaction_id = d.to_i
	end

	def feedback_already_given?(id)
		Feedback.exists?(:transaction_id => id)
	end

	def self.query criteria, querystring
		if criteria == "Request_request id"
			ServiceTransactions.all(:conditions => ["transaction_id like ?", "#{querystring}%"])
		elsif criteria == "Request_service"
			 #Comment.joins(:user).includes(:user)
			#ServiceTransactions.all(:conditions => ["types_of_services.service_name LIKE ?",  "%#{querystring}%"], :joins =>[:types_of_services])
			s = ServiceTransactions.all(:conditions => ["types_of_services.service_name LIKE ?",  "#{querystring}%"], 
				:select => [(ServiceTransactions.column_names-['id','created_at', 'updated_at']), "types_of_services.service_name"].join(', '), :joins =>"INNER JOIN types_of_services on types_of_services.id = service_transactions.service_id")
			
		elsif criteria == 'Request_status'
			ServiceTransactions.all(:conditions => ["status=?", querystring])
		elsif criteria == 'Request_username'
			ServiceTransactions.all(:conditions => ["userdetails.username like ?", "%#{querystring}%"], :joins => "INNER JOIN userdetails on service_transactions.user_id = userdetails.id")
		end
	end

	def style_status_html status
		htmlstr = "<td><span class=\"status-style\">#{status}</span></td>"
		if status == 'open'
			htmlstr.gsub("status-style", "badge badge-info")
		elsif status == 'cancelled'
			htmlstr.gsub("status-style", "badge badge-warning")
		elsif status == 'processing'
			htmlstr.gsub("status-style", "badge badge-success")
		elsif status == 'closed'
			htmlstr.gsub("status-style", "badge badge-important")
		end
	end

end
