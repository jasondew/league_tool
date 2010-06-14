require 'test_helper'

class AvailabilityTest < ActiveSupport::TestCase

  context "general availability hours" do

    should "create them" do
      assert_equal Availability.time_intervals(6,9), %w(06 07 08 09).zip(%w(6am 7am 8am 9am))
      assert_equal Availability.time_intervals(11,14), %w(11 12 13 14).zip(%w(11am 12pm 1pm 2pm))
    end
  end

end
