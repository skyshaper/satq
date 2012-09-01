class Quote < ActiveRecord::Base
  has_many :lines, dependent: :destroy, autosave: true
  has_many :people, through: :lines, uniq: true
  
  attr_accessible :description, :raw_quote
  
  default_scope order('created_at DESC')
  
  audit :description, :raw_quote
  
  def raw_quote
    lines.map(&:raw_line).join("\n")
  end
    
  def raw_quote=(raw_quote)
    self.lines = raw_quote.lines.map do |raw_line|
      Line.new(raw_line: raw_line)
    end
  end

  def self.search(body)
    body = '%' + body.gsub('%', '%%') + '%'
    
    find_by_sql(['SELECT * FROM quotes WHERE id IN 
                 (SELECT DISTINCT quote_id FROM ' + connection.quote_column_name('lines') + 
                 ' WHERE body LIKE ?) ORDER BY created_at DESC', body])
  end
  
end
