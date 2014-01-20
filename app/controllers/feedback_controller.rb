class FeedbackController < ApplicationController
	layout "services"
	
	before_filter :current_user
	before_filter :getservices

	def index
		@all_feedbacks = Feedback.all

	end
	
	def new
		@request_id = params[:id]
		#@feedback = Feedback.new
	end

	def create
		@feedback = Feedback.new(params[:feedback])
		@feedback.date = Time.now
		@feedback.labor_id = ServiceTransactions.find_by_transaction_id(params[:id]).labor_id
		@feedback.user_id = Userdetails.find_by_username(session[:username])
		@feedback.transaction_id=params[:id]

		#@feedback.feedback = "xyz"
		#@feedback.rating = params[:rating]
		

    if @feedback.valid?
      @feedback.save!
      flash[:notice] = "New feedback added!"
      redirect_to :controller => "request", :action => "index"
    else
    	flash[:notice] = "Request failed"
      render :action => "create"
    end
	end

	def show

		@feedback = Feedback.find_by_transaction_id(params[:id])

	end

	def feedback_by_labor
		@feedbacks = Feedback.find_all_by_labor_id( params[:id])		
	end

	private

	def getservices
		@services = TypesOfService.all(:select => "id, service_name")
	end
end
