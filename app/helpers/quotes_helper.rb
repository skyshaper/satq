module QuotesHelper
  def cache_key_for_quotes
    count = Quote.count
    max_updated_at = Quote.maximum(:updated_at).utc.to_s
     "quotes/all-#{count}-#{max_updated_at}"
  end
end
