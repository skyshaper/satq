class Line < ActiveRecord::Base
  belongs_to :person
  belongs_to :quote
  
  validates :person, :body, presence: true
  
  LINE_PATTERNS = [
    /<\s*([^>]+)\s*>\s*(.*)$/,
    /([^:]+):\s*(.*)$/
  ]
  
  def self.from_raw_line(raw_line)
    LINE_PATTERNS.each do |pattern|
      if raw_line =~ pattern
        person = Person.find_or_create_by_name($1)
        return Line.new(person: person, body: $2)
      end
    end
  end
  
end
