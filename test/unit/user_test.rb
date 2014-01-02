require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "invite" do
    assert_nothing_raised do
      User.invite! email: 'nobody@example.com'
    end
  end
end
