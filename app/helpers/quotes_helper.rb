module QuotesHelper
  def cache_key_for_quotes
    count = @quotes.count
    if count.zero?
      max_updated_at = ''
    else
      max_updated_at = @quotes.maximum(:updated_at).utc.to_s
    end

    if @person
      "quotes/person-#{@person.id}-#{count}-#{max_updated_at}"
    elsif @search_query
      "quotes/search-#{@search_query}-#{count}-#{max_updated_at}"
    else
     "quotes/all-#{count}-#{max_updated_at}"
    end
  end
end
