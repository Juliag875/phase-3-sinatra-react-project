class CreateRatingCol < ActiveRecord::Migration[6.1]
  def change
    add_column :user_books, :rating, :integer
  end
end
