require 'test_helper'

class UserTest < ActiveSupport::TestCase

  should_belong_to :plan

  should_have_many :memberships
  should_have_many :leagues, :through => :memberships

  should_validate_presence_of :first_name, :last_name, :email

  context "any old user" do
    setup do
      @user = Factory(:bronze_user)
    end

    should "be able to start a league" do
      league = @user.owned_leagues.build :name => "My League"
      assert_valid league
    end
  end

  context "with bronze plan" do
    setup do
      @user = Factory(:bronze_user)
      @league = @user.owned_leagues.create :name => "My League"
    end

    should "only be able to create one league" do
      league = @user.owned_leagues.build(:name => "league 2")
      assert_equal league.save, false
    end

    should "only be able to add 7 users" do
      7.times do
        Membership.create :league => @league, :user => Factory(:user)
      end

      @league.reload

      eighth_man = Membership.new :league => @league, :user => Factory(:user)
      assert !eighth_man.save
    end

  end

  context "with silver plan" do
    setup do
      @user = Factory(:silver_user)
    end

    should "only be able to create one league" do
      league_1 = @user.owned_leagues.create :name => "league 1"
      league_2 = @user.owned_leagues.build :name => "league 2"

      assert_equal league_2.save, false
    end

    should "only be able to add at least 10 users" do
      league = @user.owned_leagues.create :name => "my league"

      10.times do |i|
        assert Membership.create(:league => league, :user => Factory(:user))
      end
    end

  end

  context "with gold plan" do
    setup do
      @user = Factory(:gold_user)
    end

    should "only be able to create five leagues" do
      5.times do |i|
        league = @user.owned_leagues.build :name => "league #{i}"
        assert league.save
      end

      sixth_league = @user.owned_leagues.build :name => "over the limit league"
      assert !sixth_league.save
    end

    should "only be able to add at least 10 users" do
      league = @user.owned_leagues.create :name => "my league"

      10.times do
        assert Membership.create(:league => league, :user => Factory(:user))
      end
    end

  end
end
