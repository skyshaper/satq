require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  def assert_quote(quote)
    assert_equal 2, quote.lines.size
    assert_equal 'foo', quote.lines[0].person.name
    assert_equal 'Bar', quote.lines[0].body
    assert_equal 'bar', quote.lines[1].person.name
    assert_equal 'Spam', quote.lines[1].body
    assert_instance_of Message,quote.lines[0]
  end

  test "parse IRC format" do
    quote = Quote.new(raw_quote: "<foo>Bar\n* bar Spam")
    assert_quote quote
    assert_instance_of Message, quote.lines[0]
    assert_instance_of Action, quote.lines[1]
    assert_equal "<foo> Bar\n* bar Spam", quote.raw_quote
  end


  test "parse conversation format" do
    quote = Quote.new(raw_quote: "foo: Bar\nbar: Spam")
    assert_quote quote
    assert_instance_of Message, quote.lines[0]
    assert_instance_of Message, quote.lines[1]
  end

  test "undelete" do
    quote = quotes(:one)
    quote.snap! action: 'create'

    quote_id = quote.id
    quote.destroy!
    Quote.undelete(quote_id)
    quote = Quote.find(quote_id)
    assert_equal quote.id, quote_id
    assert_equal quote.raw_quote, '<PersonOne> MyText1'
  end
end
