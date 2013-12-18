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
		@results = ""
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
		p params
		if (params[:service_id] == '1')
			@results = Userdetails.query(params[:criteria], params[:query])
			render :partial => 'index', :locals => {:results => @results}
		elsif(params[:service_id] == '2')
			@results = Labor.query(params[:criteria], params[:query])
				p @results
			render :partial => 'indexservices', :locals => {:type => params[:service_id], :results => @results}
		elsif(params[:service_id] == '3')
		
			@results = ServiceTransactions.query(params[:criteria], params[:query])
			render :partial => 'indexservices', :locals => {:type => params[:service_id], :results => @results}
		end		
		
		
	

		

		# render :update do |page|
		# 	page.show("search_result")
		# end
		# respond_to do |format|
		# 	format.js { render :action => 'update_response'}
		#  end
	end

	def getstatus 
		searchlist = {'1' => ['active', 'inactive'], '2' => ['open','cancelled','processing','closed']} 
		if( params[:name] == 'Labourer')
			@searchoptions = searchlist['1']
			p @searchoptions[0]
			respond_to do |format|
				format.js{
					render :json => @searchoptions
				}
			end
		elsif(params[:name] == 'Request')
			@searchoptions = searchlist['2']
			respond_to do |format|
				format.js {

					render :json =>  @searchoptions
				}
				
			end
		end
	end

	def populateservice
		@services = TypesOfService.all(:select => "id, service_name")
		respond_to do |format|
			format.js {
				render :json => @services
			}
		end
	end

end