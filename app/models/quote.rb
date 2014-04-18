class Quote < ActiveRecord::Base
  has_many :lines, dependent: :destroy, autosave: true
  has_many :people, -> { uniq }, through: :lines
    
  default_scope { order('id DESC') }
  
  audit :description, :raw_quote

  PATTERNS = [
      [/<\s*([^>]+)\s*>\s*(.*)$/, Message],
      [/\*\s+([^\s]+)\s*(.*)$/, Action],
      [/([^:]+):\s*(.*)$/, Message],
      [/([^\s]+)\s*(.*)$/, Action],
  ]

  def raw_quote=(raw_quote)
    self.lines = []
    raw_quote.lines.each do |raw_line|
      begin
        self.lines << parse_line(raw_line)
      rescue LineParserError => error
        next
      end
    end
  end

  def parse_line(raw_line)
    PATTERNS.each do |pattern|
      regex, line_class = pattern
      if raw_line =~ regex
        line = line_class.new
        line.person = Person.find_or_create_by!(name: $1)
        line.body = $2
        return line
      end
    end
    raise LineParserError.new("Failed to parse: #{raw_line}")
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

  def raw_quote
    lines.map(&:raw_line).join("\n")
  end
end
