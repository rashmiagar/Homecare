class RequestController < ApplicationController
 layout "services" 
	before_filter :change_layout


	def index
		@requests = ServiceTransactions.find(:all, :conditions => {:user_id => Userdetails.find_by_username(session[:username]).id})

	end
	
	def new
		@services = TypesOfService.all

		#@transaction = ServiceTransactions.new
	end

	def create
		params[:service_transactions][:time] = params[:time][:hour] + ":" + params[:time][:minute]
		puts params[:service_transactions].inspect
		@transaction = ServiceTransactions.new(params[:service_transactions])
		@transaction.service_id = params["service_id"]
		
		#@transaction.date = params[:service_transactions]["date(1i)"].to_i
		#@transaction.time = ""
		#@transaction.labor_id = 0
		@transaction.user_id = Userdetails.find_by_username(session[:username]).id
		p "********#{Userdetails.find_by_username(session[:username]).id} #{session[:username]}"
		#@transaction.description = "xyz"
		#@transaction.address = "xyx"
		@transaction.status = 'open'
		@transaction.transaction_id = ServiceTransactions.generate_trans_id
 	    if @transaction.valid?

	    	p "**********"

			puts @transaction.inspect

	      @transaction.save!
	      flash[:notice] = "New request added!"
	    #   respond_to do |format|
	  		# format.js {
	  		# 	render :action => 'index.js.erb'
	  			
	  		# }
	  		# end
	      redirect_to :action => "index"
	    else
	    	flash[:notice] = "Request failed"
	      render :action => "create"
	    end
	end

	def show 
		@transaction = ServiceTransactions.find_by_transaction_id(params[:id])
		
	end

	def destroy
		@transaction = ServiceTransactions.find(params[:id])
		@transaction.update_attributes!(:status => "cancelled")
		flash[:notice] = "Request Cancelled !!!!"
	      redirect_to :action => "index"
	end

	def progress
		@transaction = ServiceTransactions.find_by_transaction_id(params[:id])
		@transaction.update_attributes!(:status => "processing")
		redirect_to :back
	end

	def complete
		@transaction = ServiceTransactions.find_by_transaction_id(params[:id])
		@transaction.update_attributes!(:status => "closed")
		redirect_to :back
	end

	def getlaborlist
		@searchoptions = Labor.find_all_by_types_of_service_id(params[:serviceid])
		p "*********"
		p @searchoptions.inspect
	  	respond_to do |format|
	  		format.js {
	  			#render :action => 'make_a_change'
	  			p @searchoptions.to_json(:only => [:id, :labor_name])
	  			render :json => @searchoptions.to_json(:only => [:id, :labor_name])
	  		}
	  	end
	end
private

	def change_layout
			self.class.layout "admin" if is_admin?
	end

	
end
