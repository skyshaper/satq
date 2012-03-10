class AddAssociationIndexes < ActiveRecord::Migration
  def change
    change_table :lines do |t|
      t.index :person_id
      t.index :quote_id
    end
  end
end
