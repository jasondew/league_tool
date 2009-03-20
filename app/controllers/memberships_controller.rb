class MembershipsController < ApplicationController

  before_filter :find_league

  def new
  end

  def update
    @membership = current_user.memberships.build :league_id => @league.id

    flash[:notice] = "Unable to join the league." unless @membership.save

    redirect_to league_path(@league)
  end

end
