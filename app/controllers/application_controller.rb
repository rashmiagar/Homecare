# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user

  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    if session[:username]
      @current_user ||= Userdetails.find_by_username(session[:username]) 
    else
      redirect_to "/login", :notice => "Please sign in."
    end
  end
#rescue_from ActionView::TemplateError, :with => :rescue_template_error

  def rescue_template_error(template_error)
    # any exception raised from views will be wrapped in TemplateError
    # so that you have to examine `template_error.original_exception` and
    # then use `rescue_action_without_handler` if exception should propagate 
    #render :text => "rescued TemplateError"
  end
  
  def is_admin?
  	session[:username] == 'admin'
  end

  def check_admin
   unless is_admin?
     redirect_to "/login", :notice => "Please sign in as admin."
    end
  end


def check_notadmin
   if is_admin?
     redirect_to "/login", :notice => "Please sign in as a user."
    end
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
