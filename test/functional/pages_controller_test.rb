require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  context "success" do
    setup do
      get :home
    end

    should_respond_with :success
  end

end
