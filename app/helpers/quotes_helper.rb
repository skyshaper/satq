module QuotesHelper
  def cache_key_for_quotes
    count = @quotes.count
    max_updated_at = @quotes.maximum(:updated_at).utc.to_s
    if @person 
     "quotes/person-#{@person.id}-#{count}-#{max_updated_at}"      
    else
     "quotes/all-#{count}-#{max_updated_at}"
    end
  end
end
