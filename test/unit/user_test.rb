require 'test_helper'

class UserTest < ActiveSupport::TestCase

  should_belong_to :plan

  should_have_many :memberships
  should_have_many :leagues, :through => :memberships

  should_validate_presence_of :first_name, :last_name, :email

  context "with bronze plan" do
    setup do
      @user = Factory(:bronze_user)
    end

    should "only be able to create one league" do
      league_1 = @user.leagues.build :name => "league 1"
      league_2 = @user.leagues.build :name => "league 2"

      assert league_1.save
      assert !league_2.save
    end

  end

end
