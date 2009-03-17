class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :league, :counter_cache => :players_count

  before_save :verify_plan

  private

  def verify_plan
    if limit = league.owner.plan.player_limit
      league.players_count < limit
    else
      true
    end
  end

end
