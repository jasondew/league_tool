class AvailabilitiesController < ApplicationController

  def edit
    #FIXME: need to give the form the current daily availabilities
    @availabilities = current_user.availabilities
  end

  def update
    @availabilities = current_user.availabilities

    @availabilities.clear

    params[:availabilities].split("|").each do |availability|
      day, time = availability.split "@"
      @availabilities.create :day => day, :time => time
    end

    redirect_to current_user
  end

end
