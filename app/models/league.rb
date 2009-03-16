class League < ActiveRecord::Base

  before_save :verify_plan

  belongs_to :user

  has_many :players, :class_name => "User"
  has_many :matches

  private

  def verify_plan
    user.league_addable?
  end

end
