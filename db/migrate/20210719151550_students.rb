class Students < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :fname, null: false
      t.string :lname, null: false
      t.integer :participation 
    end
  end
end
