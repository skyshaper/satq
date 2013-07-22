class LineParserError < Exception
end

class Line < ActiveRecord::Base
  belongs_to :person
  belongs_to :quote, touch: true
  
  validates :person, presence: true
  
  default_scope -> { order('id') }
  
  PATTERNS = [
    [ /<\s*([^>]+)\s*>\s*(.*)$/, false ],
    [ /\*\s+([^\s]+)\s*(.*)$/,   true ],
    [ /([^:]+):\s*(.*)$/,        false ],
    [ /([^\s]+)\s*(.*)$/,        true ],
  ]
  
  def raw_line
    if action? 
      "* #{person.name} #{body}"
    else
      "<#{person.name}> #{body}"
    end    
  end
  
  def raw_line=(raw_line)
    PATTERNS.each do |pattern|
      regex, action = pattern
      if raw_line =~ regex
        self.person = Person.find_or_create_by_name($1)
        self.body = $2
        self.action = action
        return
      end
    end
    raise LineParserError.new("Failed to parse: #{raw_line}")
  end
end
