class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9d0d87088067762cdb501b83e0974849'
  
  filter_parameter_logging :password

  protected

  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end
end
