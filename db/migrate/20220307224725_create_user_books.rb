class CreateUserBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_books do |t|
      t.references :book # t.integer :book_id 
      t.references :user
      t.boolean :available
    end
  end
end
