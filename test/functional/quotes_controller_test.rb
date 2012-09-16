require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  setup do
    @quote = quotes(:one)
    @quote_attributes = @quote.attributes.slice(:raw_quote, :description)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post :create, quote: @quote_attributes
    end

    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should show quote" do
    get :show, id: @quote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quote
    assert_response :success
  end

  test "should update quote" do
    put :update, id: @quote, quote: @quote_attributes
    assert_redirected_to quote_path(assigns(:quote))
  end
  
  test "search should return quote" do
    get :search, q: @quote.lines[0].body
    assert_match @quote.lines[0].body, @response.body
  end
  
  test "person should return quote" do
    get :person, person: @quote.people.first.name
    assert_response :success
    assert_select '.body', @quote.lines.first.body
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete :destroy, id: @quote
    end

    assert_redirected_to quotes_path
  end
  
  test "should handle HTML characteres properly (issue GH-13)" do
    get :show, id: quotes(:issue13)
    assert_select '.body', 'NONO, YOU GET THIS WRONG &lt;_&lt;'
  end
end
