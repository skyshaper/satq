class Quote < ActiveRecord::Base
  has_many :lines, dependent: :destroy, autosave: true
  has_many :people, through: :lines, uniq: true
  
  default_scope order('created_at DESC').includes(:people).includes(:lines)
  
  audit :description, :raw_quote
  
  def raw_quote
    lines.map(&:raw_line).join("\n")
  end
    
  def raw_quote=(raw_quote)
    self.lines = raw_quote.lines.map do |raw_line|
      Line.new(raw_line: raw_line)
    end
  end  
end
