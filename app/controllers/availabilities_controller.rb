class AvailabilitiesController < ApplicationController

  def edit
    #FIXME: need to give the form the current daily availabilities
    @availabilities = current_user.availabilities
  end

  def update
  end

end
