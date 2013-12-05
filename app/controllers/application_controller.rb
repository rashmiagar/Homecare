# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details


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

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
