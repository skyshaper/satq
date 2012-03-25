class CreateInitialSnapshots < ActiveRecord::Migration
  def up
    Quote.all.each do |quote|
      quote.snap!
    end
  end

  def down
  end
end
