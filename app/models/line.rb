class Line < ActiveRecord::Base
  belongs_to :person
  belongs_to :quote
  
  validates :person, :body, presence: true
  
  PATTERNS = [
    [ /<\s*([^>]+)\s*>\s*(.*)$/, false ],
    [ /\*\s+([^\s]+)\s*(.*)$/,   true ],
    [ /([^:]+):\s*(.*)$/,        false ],
  ]
  
  def self.from_raw_line(raw_line)
    PATTERNS.each do |pattern|
      regex, action = pattern
      if raw_line =~ regex
        person = Person.find_or_create_by_name($1)
        return Line.new(person: person, body: $2, action: action)
      end
    end
  end
end
