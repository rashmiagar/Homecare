class ServicesController < ApplicationController
 layout "services"
 
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
      render :template => '/admin/addservice', :layout => 'admin'
    end
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
end
