class Teachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :email, null: false 
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.timestamps 
    end 
    add_index :teachers, :email, unique: true 
    add_index :teachers, :session_token, unique: true 
  end
end 