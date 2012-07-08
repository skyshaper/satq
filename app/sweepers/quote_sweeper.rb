class QuoteSweeper < ActionController::Caching::Sweeper
  observe Quote
 
  def after_create(quote)
    expire_cache_for(quote)
  end
 
  def after_update(quote)
    expire_cache_for(quote)
  end
 
  def after_destroy(quote)
    expire_cache_for(quote)
  end
 
  private
  def expire_cache_for(quote)
    expire_page(controller: 'quotes', action: 'index') 
    expire_page(controller: 'quotes', action: 'show', id: quote.id) 

    
    quote.people.each do |person|
      expire_page(controller: 'quotes', action: 'person', person: person.name)
    end
 
    expire_fragment(quote)
  end
end