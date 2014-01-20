class ServicesController < ApplicationController
 layout "services"
 before_filter :current_user
  before_filter :check_admin, :only => [:new, :create, :edit, :destroy, :update]
  before_filter :check_notadmin, :only => [:show]
 before_filter :getservices

  def index
    p "************"
    p params['userid']
    @userid = params['userid']
    @userdetails = Userdetails.find_by_id(params['userid'])
  end

  def new
    @newservice = TypesOfService.new
  end

  def create
    @newservice = TypesOfService.new(params["types_of_service"])
    if @newservice.valid?
      @newservice.save
      flash[:notice] = "New service added!"
      redirect_to '/admin/addservice'
    else
      flash[:notice] = @newservice.errors.full_messages
      render :template => '/admin/addservice', :layout => 'admin'
    end
  end

  def show
    @labors = Labor.find_all_by_types_of_service_id(params[:id])

  end

  def edit
  end

  def destroy
    service = TypesOfService.find(params[:id])
    service.destroy
    flash[:alert] = "Service removed"
    redirect_to '/admin/viewservice'
  end

  def update
  end

private 

  def getservices
    @services = TypesOfService.all(:select => "id, service_name")
  end
end
