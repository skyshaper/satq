require 'test_helper'

class LineTest < ActiveSupport::TestCase
  def assert_line(line)
    assert_equal 'foo', line.person.name
    assert_equal 'bar', line.body
  end
  
  test "parse IRC format" do
    line = Line.from_raw_line('<foo> bar')
    assert_line line
    assert_equal false, line.action?
    
  end
  
  test "parse IRC action format" do
    line = Line.from_raw_line('* foo bar')
    assert_line line
    assert_equal true, line.action?
  end
  
  test "parse conversation format" do
    line = Line.from_raw_line('foo: bar')
    assert_line line
    assert_equal false, line.action?
  end
end
