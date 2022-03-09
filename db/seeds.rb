Book.destroy_all
User.destroy_all
UserBook.destroy_all

puts "🌱 Seeding user..."
  10.times do 
    User.create(name: Faker::Name.name)
  end

puts "🌱 Seeding books..."

  10.times do 
    image_urls = ["https://img.thriftbooks.com/api/images/m/3ab0f4fb13db7ba1cde5a5cd8e10cdadedbd2447.jpg", "https://images-na.ssl-images-amazon.com/images/I/81iqZ2HHD-L.jpg", "https://images-na.ssl-images-amazon.com/images/I/615ZIxEDozL.jpg", "https://img.thriftbooks.com/api/images/m/3c0c38a2f13b39306276a178d92060c50e12afe4.jpg", "https://i5.walmartimages.com/asr/c689fef9-ae17-4530-a7fa-46282df3f7b7.27e61eddb2d243110a751d98571474c7.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHnzPbErvmGUx7NAVb2arXKTrqYjgUC6_8ZQ&usqp=CAU"]
    Book.create(
      title: Faker::Book.title,
      description: Faker::Movies::HarryPotter.quote,
      image: image_urls.sample
    )
  end

puts "🌱 Seeding userBook..."
  10.times do
    UserBook.create(
      user_id: User.ids.sample,
      book_id: Book.ids.sample, 
      available: rand(0..1),
      rating: rand(1..10)
  )
  end

puts "✅ Done seeding!"
