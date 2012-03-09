require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  def assert_quote(quote)
    assert_equal 2, quote.lines.size
    assert_equal 'foo', quote.lines[0].person.name
    assert_equal 'Bar', quote.lines[0].body
    assert_equal 'bar', quote.lines[1].person.name
    assert_equal 'Spam', quote.lines[1].body
  end
  
  test "parse IRC format" do
    quote = Quote.from_raw_quote("<foo>Bar\n<bar>Spam")
    assert_quote quote
  end
  
  test "parse conversation format" do
    quote = Quote.from_raw_quote("foo: Bar\nbar: Spam")
    assert_quote quote
  end
end
