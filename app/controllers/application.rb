class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  before_filter :login_required

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9d0d87088067762cdb501b83e0974849'
  
  filter_parameter_logging :password

  protected

  def find_league
    @league = League.find(params[:league_id]) if params[:league_id]
  end
end
