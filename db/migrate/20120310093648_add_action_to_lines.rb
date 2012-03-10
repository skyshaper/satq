class AddActionToLines < ActiveRecord::Migration
  def change
    add_column :lines, :action, :bool

  end
end
