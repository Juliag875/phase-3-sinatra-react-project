class Book < ActiveRecord::Base
  has_many :user_books
  has_many :users, through: :user_books

  def books_plus_join_data
    self.user_books.map do |user_book|
      {
        user_book_id: user_book.id, 
        available: user_book.available,
        rating: user_book.rating,
        book: user_book.book
      }
    end
  end
end