require 'test_helper'

class AvailabilitiesControllerTest < ActionController::TestCase

  context "logged in" do
    setup do
      @user = logged_in
    end

    context "edit action" do
      setup { get :edit, :user_id => @user.id }

      should_respond_with :success
    end

    context "update action" do
    end
  end

end
