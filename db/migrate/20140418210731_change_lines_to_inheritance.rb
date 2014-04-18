class ChangeLinesToInheritance < ActiveRecord::Migration
  def up
    add_column :lines, :type, :string

    execute <<-SQL
      UPDATE lines SET type = 'Message' WHERE NOT action;
      UPDATE lines SET type = 'Action' WHERE action;
    SQL

    remove_column :lines, :action
  end

  def down
    add_column :lines, :action, :boolean

    execute <<-SQL
      UPDATE lines SET action = false WHERE type = 'Message';
      UPDATE lines SET action = true WHERE type = 'Action';
    SQL

    remove_column :lines, :type
  end
end
