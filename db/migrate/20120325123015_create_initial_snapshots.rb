class CreateInitialSnapshots < ActiveRecord::Migration
  def up
    Quote.all.each do |quote|
      quote.snap! action: 'create'
    end
  end

  def down
  end
end
