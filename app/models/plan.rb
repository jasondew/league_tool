class Plan < ActiveRecord::Base

  before_save :validate_plan

  has_many :users

  def validate_plan
  end

end
