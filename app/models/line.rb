class LineParserError < Exception
end

class Line < ActiveRecord::Base
  belongs_to :person
  belongs_to :quote, touch: true
  
  validates :person, presence: true
  
  default_scope -> { order('id') }
  
end
