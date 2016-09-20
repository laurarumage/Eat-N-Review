User.delete_all
Restaurant.delete_all
Review.delete_all

20.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )
end

20.times do
  Restaurant.create(
    creator_id: User.all.shuffle[0].id,
    name: Faker::Hipster.word,
    cuisine: Faker::Address.country,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code
    )
end

20.times do
  Review.create(
    customer_id: User.all.shuffle[0].id,
    restaurant_id: Restaurant.all.shuffle[0].id,
    rating: rand(1..5),
    body: Faker::Hipster.paragraph
    )
end
