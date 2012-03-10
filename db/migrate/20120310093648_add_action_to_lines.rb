class AddActionToLines < ActiveRecord::Migration
  def change
    add_column :lines, :action, :boolean

  end
end
