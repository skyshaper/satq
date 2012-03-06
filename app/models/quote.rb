class Quote < ActiveRecord::Base
  has_many :lines
  has_many :people, through: :lines
  
  def self.build_from_lines(raw_lines)
    lines = raw_lines.map do |line|
      Line.new(person: Person.find_or_create_by_name(line[0]), body: line[1])
    end
    
    Quote.new(lines: lines)
  end
end
