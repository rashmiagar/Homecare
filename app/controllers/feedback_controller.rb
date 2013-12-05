class FeedbackController < ApplicationController
	layout "services"

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
		@feedback.labor_id = 0
		@feedback.user_id = Userdetails.find_by_username(session[:username])
		@feedback.transaction_id=params[:id]
		#@feedback.feedback = "xyz"
		#@feedback.rating = 5
		

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
		
	end
end
