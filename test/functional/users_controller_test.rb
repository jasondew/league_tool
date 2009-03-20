require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  context "show success" do
    setup do
      user = logged_in
      get :show, :id => user.id
    end

    should_respond_with :success
  end

  context "new success" do
    setup { get :new }
    should_respond_with :success
  end

end
