class Line < ActiveRecord::Base
  belongs_to :person
  belongs_to :quote
  
  validates :person, :body, presence: true
  
  MESSAGE_PATTERNS = [
    /<\s*([^>]+)\s*>\s*(.*)$/,
    /([^:]+):\s*(.*)$/
  ]
  
  ACTION_PATTERNS = [
    /\*\s+([^\s]+)\s*(.*)$/
  ]
  
  def self.from_raw_line(raw_line)
    MESSAGE_PATTERNS.each do |pattern|
      if raw_line =~ pattern
        person = Person.find_or_create_by_name($1)
        return Line.new(person: person, body: $2)
      end
    end
    ACTION_PATTERNS.each do |pattern|
      if raw_line =~ pattern
        person = Person.find_or_create_by_name($1)
        return Line.new(person: person, body: $2, action: true)
      end
    end
    raise Exception.new("Failed to parse #{raw_line}")
  end
end
