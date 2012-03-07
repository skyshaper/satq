class Quote < ActiveRecord::Base
  has_many :lines, autosave: true
  has_many :people, through: :lines, uniq: true
end
