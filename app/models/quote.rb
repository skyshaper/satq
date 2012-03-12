class Quote < ActiveRecord::Base
  has_many :lines, dependent: :destroy, autosave: true
  has_many :people, through: :lines, uniq: true
    
  def self.from_raw_quote(raw_quote, description)
    lines = raw_quote.lines.map do |raw_line|
      Line.from_raw_line(raw_line)
    end
    
    Quote.new(lines: lines, description: description)
  end
  
  def replace_with_raw_quote!(raw_quote, new_description)
    self.description = new_description

    self.lines = raw_quote.lines.map do |raw_line|
      Line.from_raw_line(raw_line)
    end
  end
  
end
