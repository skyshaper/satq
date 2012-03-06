class Line < ActiveRecord::Base
  belongs_to :person
  belongs_to :quote
  
  validates :person, :body, presence: true
end
