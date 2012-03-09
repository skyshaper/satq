class Quote < ActiveRecord::Base
  has_many :lines
  has_many :people, through: :lines, uniq: true
  

  def self.from_raw_quote(raw_quote)
    lines = raw_quote.lines.map do |raw_line|
      Line.from_raw_line(raw_line)
    end
    
    Quote.new(lines: lines)
  end
  
  def replace_with_raw_quote(raw_quote)
    self.lines = raw_quote.lines.map do |raw_line|
      Line.from_raw_line(raw_line)
    end
  end
  
end
