class Match < ActiveRecord::Base

  belongs_to :league
  belongs_to :home_player, :class_name => "User"
  belongs_to :away_player, :class_name => "User"

end
