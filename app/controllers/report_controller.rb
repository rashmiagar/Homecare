class ReportController < ApplicationController
	layout "admin"

	before_filter :current_user
	before_filter :check_admin
	
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

	def activate
		user = Userdetails.find(params[:id])
		user.update_attributes!(:status => "active")
		flash[:notice] = "User #{user.username} activated!"
		redirect_to :action => "usersreport"
	end

	def deactivate
		user = Userdetails.find(params[:id])
		user.update_attributes!(:status => "inactive")
		flash[:notice] = "User #{user.username} deactivated successfully!"
		redirect_to :action => "usersreport"
	end

end
