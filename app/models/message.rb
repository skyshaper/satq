class Message < Line
  def raw_line
    "<#{person.name}> #{body}"
  end
end