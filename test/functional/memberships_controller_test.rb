require 'test_helper'

class MembershipsControllerTest < ActionController::TestCase

  context "logged in" do
    setup do
      @user = logged_in
      @league = Factory(:league)
    end

    context "new action" do
      setup { get :new, :user_id => @user.id, :league_id => @league.id }

      should_respond_with :success
    end

    context "update action" do
      setup do
        post :update, :user_id => @user.id, :league_id => @league.id
      end

      should_assign_to :membership
      should_not_set_the_flash
      should_redirect_to("league page") { league_path @league }
    end
  end

end
