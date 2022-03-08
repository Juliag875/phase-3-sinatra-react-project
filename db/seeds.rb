Book.destroy_all
User.destroy_all
UserBook.destroy_all

puts "🌱 Seeding user..."
  10.times do 
    User.create(name: Faker::Name.name)
  end

puts "🌱 Seeding books..."
  10.times do 
    Book.create(
      title: Faker::Book.title,
      description: Faker::Movies::HarryPotter.quote,
      image: "https://img.thriftbooks.com/api/images/m/3ab0f4fb13db7ba1cde5a5cd8e10cdadedbd2447.jpg"
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
