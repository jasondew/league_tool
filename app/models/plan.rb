class Plan < ActiveRecord::Base

  before_save :validate_plan

  caches_constants

  has_many :users

  def validate_plan
  end

end
