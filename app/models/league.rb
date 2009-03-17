class League < ActiveRecord::Base

  belongs_to :owner, :class_name => "User", :foreign_key => "user_id", :counter_cache => true

  has_many :memberships
  has_many :players, :class_name => "User", :through => :memberships
  has_many :matches

  before_save :verify_plan

  private

  def verify_plan
    owner ||= User.find user_id
    owner.leagues_count < owner.plan.league_limit
  end

end
