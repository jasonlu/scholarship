require 'test_helper'

class MyAccountControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get cart" do
    get :cart
    assert_response :success
  end

  test "should get receipt" do
    get :receipt
    assert_response :success
  end

  test "should get choose_start_day" do
    get :choose_start_day
    assert_response :success
  end

  test "should get study_record" do
    get :study_record
    assert_response :success
  end

  test "should get self_learning" do
    get :self_learning
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
