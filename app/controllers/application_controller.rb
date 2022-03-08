class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # display all books
  get '/books' do
    Book.all.to_json
  end

  # get users
  get "/users" do
    User.all.to_json
  end 

  get "/users/:id" do
    User.find(params[:id]).to_json
  end 

  # get a book
  get "/mybooks/:id" do
    User.find(params[:id]).books.all.to_json
  end

  post "/users/:id" do 
    # User.find(params[:id]).user_books.create(book_id: param[:book_id], available: false, rating: 0)
    # ).to_json

    # params = {user_id: 1, book_id: 10, availble: false, rating: 0}
    
    UserBook.create(params).to_json
  end

  patch '/books/:id' do
    UserBook.find(params[:id]).update(rating: params[:rating]).to_json
  end

  patch '/users/:id/claim_book' do
    UserBook.find(params[:id]).update(user_id: params[:user_id]).to_json
  end

  patch '/users/:id/sell_book' do
    UserBook.find(params[:id]).update(available: true).to_json
  end

  delete '/books/:id' do
    Book.find(params[:id]).destroy.to_json
  end

end
