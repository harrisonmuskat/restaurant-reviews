restaurants = []

10.times do
  restaurant = {}
  restaurant[:name] = Faker::Company.name
  restaurant[:address] = Faker::Address.street_address
  restaurant[:city] = Faker::Address.city
  restaurant[:state] = Faker::Address.state_abbr
  restaurant[:zip] = Faker::Address.zip_code.to_i
  restaurant[:description] = Faker::Hipster.paragraph
  restaurants << restaurant
end

restaurants.each do |restaurant_params|
  name = restaurant_params[:name]
  restaurant = Restaurant.find_or_initialize_by(name: name)
  restaurant.assign_attributes(restaurant_params)
  restaurant.save!
end

reviews = []

30.times do
  review = {}
  random_rating = Random.new
  review[:rating] = random_rating.rand(1..5)
  review[:body] = Faker::Hipster.paragraph
  review[:restaurant] = Restaurant.all.sample
  reviews << review
end

reviews.each do |review_params|
  body = review_params[:body]
  review = Review.find_or_initialize_by(body: body)
  review.assign_attributes(review_params)
  review.save!
end
