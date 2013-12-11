class LaborController < ApplicationController
	include LaborHelper
	layout 'admin'

	before_filter :getservice, :clear_flash_messages
	before_filter :getlabor, :except => [:new, :create]
	before_filter :getcriteria, :only => [:dosearch, :search]

	def new
		labor = Labor.new
	end

	def list
		# render :update do |page|
	 #      page.replace_html 'labortable', :partial => 'viewlabor'
	 #    end
	 	@labors = Labor.all(:conditions => {:types_of_service_id => params['id']})
	 	render :partial => 'viewlabor'
	end

	def create
		labor = Labor.create(params[:labors])
		labor.types_of_service_id = params[:service_id]
		if labor.save
			flash[:notice] = "labor added successfully"
			render :new
		else	
			flash[:notice] = "unable to add labor"
			render :new
		end

	end

	def show
		
	end

	def destroy
		labor = Labor.find(params[:id])
		service_id= labor.types_of_service_id
		labor.destroy
		@labors = Labor.all(:conditions => {:types_of_service_id => service_id})
		flash[:notice] = "Labor removed"
		render :update do |page|
			page.replace_html 'labordiv', :partial => 'viewlabor', :object => @labors
			page.show
		end
	end

	def getservice
		@services = TypesOfService.all
		
	end
	def getlabor
		@labors = Labor.all(:conditions => {:types_of_service_id => @services[0].id})
	end

	def getcriteria
		@searchoptions = getsearch_options
		@crit = @searchoptions['1']
	end

	def clear_flash_messages
		flash.clear
	end



	def getsearchoptions
		searchlist = {'1' => ['name', 'phone', 'email'], '2' => ['name', 'phone', 'status', 'city'], '3' => ['request id', 'service', 'status', 'username']} 
		@searchoptions = searchlist[params[:serviceid]]
		p @searchoptions[0]
	  	respond_to do |format|
	  		format.js {
	  			#render :action => 'make_a_change'
	  			render :json => @searchoptions
	  		}
	  	end
	end

	def dosearch
		p "**********"
		p params['service_id']

		@searchoptions = getsearch_options
		@search_criteria = @searchoptions[params['service_id']]
		p @searchoptions
		p @search_criteria
		






		render :partial => 'index', :locals => {:crit => @search_criteria}






		# render :update do |page|
		# 	page.show("search_result")
		# end
		# respond_to do |format|
		# 	format.js { render :action => 'update_response'}
		#  end
	end
end