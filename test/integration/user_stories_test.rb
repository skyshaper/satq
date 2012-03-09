require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  test "root is redirected to quote index" do
    get '/'
    assert_redirected_to quotes_url
  end
end
