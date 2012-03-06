class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :person_id
      t.integer :quote_id
      t.text :body

      t.timestamps
    end
  end
end
