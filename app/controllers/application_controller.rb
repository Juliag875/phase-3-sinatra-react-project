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
# get current user - hardcoded as first user
  get "/currentuser" do 
    User.first.to_json
  end

  get "/users/:id" do
    User.find(params[:id]).to_json
  end 

  # all available books
  get '/availablebooks' do
    # UserBook.books.to_json
    UserBook.all.where("available = ?", true).to_json( include: :book)
  end

  get '/availablebooks/:id' do
    # UserBook.books.to_json
    UserBook.all.where("available = ?", true).find(params[:id]).to_json( include: :book)
  end

  patch '/availablebooks/:id' do
      userbook = UserBook.find(params[:id])
      attrs_to_update = params.select do |key, value| 
        [ "available", "user_id"].include?(key)
      end
      userbook.update(attrs_to_update)
      userbook.to_json
    # UserBook.all.where("available = ?", true).find(params[:id]).update(availabe: false, user_id: params[:user_id]).to_json
  end


  get "/mybooks" do
    User.first.books_plus_join_data.to_json
  end

  get '/mybooks/:id' do
    User.first.user_books.find(params[:id]).to_json
  end


  patch '/mybooks/:id' do 
    User.first.user_books.find(params[:id]).update(available: params[:available]).to_json
  end

  post "/mybooks" do 
      User.first.user_books.create(book_id: params[:book_id], user_id: params[:user_id], available: false, rating: 0).to_json
    end

    # User.find(params[:id]).user_books.create(book_id: param[:book_id], available: false, rating: 0).to_json

    # params = {user_id: 1, book_id: 10, availble: false, rating: 0}
    
    # UserBook.create(params).to_json


  # patch '/books/:id' do
  #   UserBook.find(params[:id]).update(rating: params[:rating]).to_json
  # end

  # patch '/users/:id/claim_book' do
  #   UserBook.find(params[:id]).update(user_id: params[:user_id]).to_json
  # end

  # patch '/users/:id/sell_book' do
  #   UserBook.find(params[:id]).update(available: true).to_json
  # end

  # delete '/books/:id' do
  #   Book.find(params[:id]).destroy.to_json
  # end

end
