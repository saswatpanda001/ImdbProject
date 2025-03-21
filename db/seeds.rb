# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'
require 'faker'

csv_books_path = Rails.root.join('db', 'seeds', '../../datasets/imdb_movies.csv')
row_count = 0

CSV.foreach(csv_books_path, headers: true) do |row|
  break if row_count >= 200

  release_date = begin
    Date.strptime(row['release_date'], '%m/%d/%Y')
  rescue ArgumentError
    Faker::Date.between(from: '1900-01-01', to: Date.today)
  end

  Movie.create!(
    title: row['title'],
    release_date: release_date,
    budget: row['budget'].to_f,
    revenue: row['revenue'].to_f,
    genre: Faker::Book.genre,
    overview: row['overview']
  )
  
  row_count += 1
  puts "Created movie: #{row['title']} with release date: #{release_date}"
end

puts "Movies imported successfully! Total: #{row_count} movies."




200.times do
    Actor.create!(
      name: Faker::Name.name,
      birth_year: rand(1940..2010),
      nationality: Faker::Address.country
    )
  end

  puts "200 actors have been created successfully!" 

  200.times do
    Director.create!(
      name: Faker::Name.name,
      birth_year: rand(1940..2000),
      nationality: Faker::Address.country
    )
  end
  
  puts "200 directors have been created successfully!"
  
  
  
  
  
  
require 'faker'

movie_ids = Movie.pluck(:id)
actor_ids = Actor.pluck(:id)

movie_ids.each do |movie_id|
  rand(3..5).times do
    MovieActor.create!(
      movie_id: movie_id,
      actor_id: actor_ids.sample
    )
  end
  puts "Added actors for movie ID: #{movie_id}"
end

puts "Movie-Actor relationships created successfully!"





require 'faker'

movie_ids = Movie.pluck(:id)
director_ids = Director.pluck(:id)

movie_ids.each do |movie_id|
  rand(1..3).times do
    MovieDirector.create!(
      movie_id: movie_id,
      director_id: director_ids.sample
    )
  end
  puts "Added directors for movie ID: #{movie_id}"
end

puts "Movie-Director relationships created successfully!"




require 'faker'

movie_ids = Movie.pluck(:id)

movie_ids.each do |movie_id|
  rand(15..20).times do
    Review.create!(
      movie_id: movie_id,
      review_text: Faker::Lorem.paragraph(sentence_count: rand(3..8)),
      rating: rand(1.0..10.0).round(1)
    )
  end
  puts "Added reviews for movie ID: #{movie_id}"
end

puts "Reviews added successfully!"






# Path to your CSV file
csv_file_path = Rails.root.join('db', '../datasets/actorlocation.csv')

# Read CSV and update actors
CSV.foreach(csv_file_path, headers: true).with_index do |row, index|
  # Find the actor by ID (assuming that the actor's ID corresponds to the row index + 1)
  actor = Actor.find_by(id: index + 1)
  
  if actor
    latitude = row['Latitude'].to_f
    longitude = row['Longitude'].to_f

    # Update actor with latitude and longitude
    actor.update(latitude: latitude, longitude: longitude)

    puts "Updated actor #{actor.id} with Latitude: #{latitude}, Longitude: #{longitude}"
  else
    puts "Actor with ID #{index + 1} not found."
  end
end

puts "✅ Seeding completed!"
