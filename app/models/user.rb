class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, through: :user_books

  # see their own library of books
  def my_books
    self.books.all
  end

  # show available books for single user
  def show_my_books
    User.first.books.where("available = ?", true)
    # self.first.books
  end


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

  # def create_user_book()
  #   # params = {all things react sent back}
  #   UserBook.create(user_id:  ,book_id: ,available: false, rating: 0)
  # end

# list book as available for other users
  # def sell_books(user, book)
  #   if book.book_id == self
  #     book.update(user_id: user.id)
  #   end
  # end

end