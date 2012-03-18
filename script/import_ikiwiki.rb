require "nokogiri"

def parse(file, filter)
  doc = Nokogiri::HTML(open(file))
  doc.css(filter).each do |p|
    begin
      quote = Quote.new(raw_quote: p.content.strip)
      quote.save!
    rescue Exception => e
      puts p.content
      puts e
    end
  end
end

parse('archive.html', '.inlinecontent')
parse('happyman.html', '#content p')
parse('horstbert.html', '#content p')