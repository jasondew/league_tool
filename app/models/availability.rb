class Availability < ActiveRecord::Base

  DAYS = [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]

  belongs_to :user

  def self.time_intervals start_hour, end_hour
    hours = []

    start_hour.upto(end_hour) do |hour|
      hour_text = hour % 12
      hour_text = 12 if hour_text == 0
      am_pm = hour >= 12 ? 'pm' : 'am'

      hours << ["%02d" % hour, "#{hour_text}#{am_pm}"]
    end

    hours
  end

end
