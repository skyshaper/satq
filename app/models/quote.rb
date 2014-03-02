class Quote < ActiveRecord::Base
  has_many :lines, dependent: :destroy, autosave: true
  has_many :people, -> { uniq }, through: :lines
    
  default_scope { order('id DESC') }
  
  audit :description, :raw_quote
  
  def raw_quote
    lines.map(&:raw_line).join("\n")
  end
    
  def raw_quote=(raw_quote)
    lines = []
    
    raw_quote.lines.map do |raw_line|
      begin
        lines << Line.new(raw_line: raw_line)
      rescue LineParserError => error
        next
      end
    end
    
    self.lines = lines
  end

  def self.search(body)
    body = '%' + body.gsub('%', '%%') + '%'
    
    Quote.joins(:lines).where(Line.arel_table[:body].matches(body)).uniq
  end
  
  def self.undelete(quote_id)
    last_audit = Auditable::Audit.where(auditable_type: 'Quote', auditable_id: quote_id).order('created_at DESC').first
    quote_attributes = last_audit.modifications
    quote_attributes[:id] = quote_id
    Quote.create!(quote_attributes)
  end
  
end
