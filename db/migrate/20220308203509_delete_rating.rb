class DeleteRating < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :rating, :integer
  end
end
