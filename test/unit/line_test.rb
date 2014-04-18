require 'test_helper'

class LineTest < ActiveSupport::TestCase
  def assert_line(line)
    assert_equal 'foo', line.person.name
    assert_equal 'bar', line.body
  end

end
