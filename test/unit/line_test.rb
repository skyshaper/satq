require 'test_helper'

class LineTest < ActiveSupport::TestCase
  def assert_line(line)
    assert_equal 'foo', line.person.name
    assert_equal 'bar', line.body
  end
  
  test "parse IRC format" do
    line = Line.new(raw_line: '<foo> bar')
    assert_line line
    assert_equal false, line.action?
    assert_equal '<foo> bar', line.raw_line
  end
  
  test "parse IRC action format" do
    line = Line.new(raw_line: '* foo bar')
    assert_line line
    assert_equal true, line.action?
    assert_equal '* foo bar', line.raw_line
  end
  
  test "parse conversation format" do
    line = Line.new(raw_line: 'foo: bar')
    assert_line line
    assert_equal false, line.action?
    assert_equal '<foo> bar', line.raw_line
  end
  
  test "trigger parser exception" do
    assert_raise Exception do
      Line.new(raw_line: '')
    end
  end
end
