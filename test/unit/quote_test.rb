require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  test "build from lines" do
    raw_lines = [
      ['Person1', 'Body1'],
      ['Person2', 'Body2']
    ]
    quote = Quote.build_from_lines(raw_lines)
    assert_equal 2, quote.lines.size
    assert_equal 'Body1', quote.lines[0].body
    assert_equal 'Body2', quote.lines[1].body
    assert_equal 'Person1', quote.lines[0].person.name
    assert_equal 'Person2', quote.lines[1].person.name
  end
end
