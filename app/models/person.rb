class Person < ActiveRecord::Base
  has_many :lines
  has_many :quotes, -> { uniq }, through: :lines
  
  validates :name, presence: true
  validates :name, uniqueness: true
end
