class Person < ActiveRecord::Base
  has_many :lines
  has_many :quotes, through: :lines, uniq: true
  
  validates :name, presence: true
  validates :name, uniqueness: true

  attr_accessible
end
