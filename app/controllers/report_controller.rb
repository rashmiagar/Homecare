class ReportController < ApplicationController
	layout "admin"

	def requestreport
		@requests = ServiceTransactions.find(:all)
	end

	def laborreport
		@labors = Labor.all
	end

	def usersreport 
		@users = Userdetails.all
	end

	def servicesreport
		@servicetypes = TypesOfService.all
	end

	def feedbackreport
		@feedbacks = Feedback.all
		
	end

end
