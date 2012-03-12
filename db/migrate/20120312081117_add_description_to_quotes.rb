class AddDescriptionToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :description, :text

  end
end
