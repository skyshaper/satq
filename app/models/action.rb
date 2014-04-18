class Action < Line
  def raw_line
    "* #{person.name} #{body}"
  end
end