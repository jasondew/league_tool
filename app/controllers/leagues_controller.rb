class LeaguesController < ApplicationController

  def new
    #FIXME need to add a live search or city & state search here
    @leagues = League.all - current_user.leagues
  end

  def show
    @league = League.find params[:id]
  end

end
