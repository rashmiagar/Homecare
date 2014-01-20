class LoginController < ApplicationController
  include LoginHelper
	before_filter :clear_flash_messages, :only => [:signin]
  after_filter :clear_flash_messages
  before_filter :get_user

	def clear_flash_messages 
		flash[:notice] = nil
	end

  def index
    if session[:username] 
      @userdetails = Userdetails.find_by_username(session[:username])
    end
     #render :partial => 'login', :layout => 'login'
     respond_to do |format|
      format.html { render :partial => 'login', :layout => 'login'}
      format.js {  render :template => 'login/login.js.erb', :layout => false}
     end
    
    clear_flash_messages
  end

  # def redirect_homepage
  #   if params[:id] =='new'
  #     render :template => 'login/newuser'
  #   else
  #     render :template => 'login/index'
  #   end
  # end

  def update
    if @userdetails.update_attributes(params[:userdetails])
      @userdetails.save
      flash[:notice] = "Updated sucessfully"
    else 
      flash[:notice] = "Update failed"
    end
    render :js => '/services/edituser', :layout => "services"
  end

  def signin
  	puts "sigin action"

    session[:username] = params[:username]
      # To get from file use this
    # file = File.new("#{RAILS_ROOT}/tmp/file.txt", "r")
    # while (line = file.gets)
    #   username1= line.split(";").first.strip
    #   password1= line.split(";").last.strip
    #   if params[:username] == username1 && params[:password] == password1
    #     # file.close
    #     flash[:notice] = "Login successfull"
    #     render :template => "login/result"
    #     return
    #   end
    # end
    @userdetails = Userdetails.find_by_username(params[:username])
    if @userdetails && @userdetails.is_active?
      if @userdetails.username == params[:username] && params[:password] == @userdetails.password
        flash[:notice] = "Login successfull"
        
        if params[:username] == 'admin'
          render '/admin/admin', :layout => 'admin'
        else
          redirect_to :controller => 'services', :action => 'index', :userid => @userdetails.id
        end
      else 
        flash[:notice] = "Login failed. Username/Password invalid."
        render :partial => "login", :layout => 'login'
        clear_flash_messages
      end
    else
      flash[:notice] = "User has been deactivated. Please contact administrator."
      render :partial => "login", :layout => 'login'
    end
    
    
    
  end

def create_user
  p params[:username]

  @userdetails = Userdetails.find_by_username(params[:username])
  if @userdetails
    if @userdetails.username == params[:username]
      flash[:notice] = "User already exists !!!"
      render :action => "newuser"
      clear_flash_messages
      return
    end  
  end

  @userdetails = Userdetails.new(:username => params[:username], :password => params[:password], :password_confirmation => params[:password_confirmation],
            :firstname => params[:firstname], :lastname => params[:lastname], :birthday => params[:birthday], :email => params[:email], :phone => params[:phone])
  if @userdetails.save
    puts "User saved"
    flash[:notice] = "Registered successfully. Please login with your credentials. "
    session[:username] = params[:username]
    send_email  
    render :partial => "login"
    return
  else
    #flash[:notice] = @userdetails.errors.full_messages
    render :template => "login/newuser"
    clear_flash_messages
    return
  end
end

def save_password
  usrdetails = Userdetails.find_by_username(session[:username])

  if (params[:old_password] == usrdetails[:password]) && (params[:new_password] == params[:confirm_password])
    usrdetails.update_attributes!({:password => params[:new_password]})
    flash[:notice] = "Password changed successfully!"
    render 'login/home' and return
  else
    flash[:notice] = "Old password is incorrect!!!!!!"
    redirect_to 'services/change_password'
  end
end

def logout
  reset_session
  flash[:notice] = "Logged out successfully"
  redirect_to '/login'
end

def send_email
  Notifier.deliver_message("hi", "Hi", Userdetails.find_by_username(session[:username]))
  
end

def get_user
  if(session[:username])
    @userdetails = Userdetails.find_by_username(session[:username])
  end
end
end
