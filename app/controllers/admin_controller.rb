class AdminController < ApplicationController
	before_filter :current_user
  before_filter :check_admin
  before_filter :get_user

def save_password
  usrdetails = Userdetails.find_by_username(session[:username])

  if (params[:old_password] == usrdetails[:password]) && (params[:new_password] == params[:confirm_password])
    usrdetails.update_attributes!({:password => params[:new_password]})
    flash[:notice] = "Password changed successfully!"
    redirect_to '/login/home' and return
  else
    flash[:notice] = "Old password is incorrect!!!!!!"
    render 'change_password'
  end
end

def get_user
  if(session[:username])
    @userdetails = Userdetails.find_by_username(session[:username])
  end
end

  def viewservice
    @servicetypes = TypesOfService.all   
    render :partial => 'viewservice', :locals => {:servicetypes => @servicetypes}, :layout => 'admin'
   end
end
