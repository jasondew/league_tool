require 'test_helper'

class LeaguesControllerTest < ActionController::TestCase

  context "with user logged in" do
    setup do
      @user = logged_in
    end

    context "new action" do
      setup do
        get :new
      end

      should_respond_with :success
    end

    context "show action" do
      setup do
        get :show, :id => Factory(:league).id
      end

      should_respond_with :success
    end
  end

end
