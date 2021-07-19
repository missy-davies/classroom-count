class Classes < ActiveRecord::Migration[5.2]
  def change
    create_table :classes do |t|
      t.string :name, null: false
      t.integer :teacher_id
      t.integer :student_id
    end 
  end
end
