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

  # get a book
  get "/mybooks/:id" do
    User.find(params[:id]).books.all.to_json
  end

  post "/mybooks" do 
    User.find(params[:id].create_book(
      title: params[:title],
      description: params[:description],
      image: params[:image],
    )).to_json
  end

  patch '/books/:id' do
    UserBook.find(params[:id]).update(rating: params[:rating]).to_json
  end

  patch '/users/:id' do
    UserBook.find(params[:id]).update(user_id: params[:user_id]).to_json
  end

  delete '/books/:id' do
    Book.find(params[:id]).destroy.to_json
  end

end
