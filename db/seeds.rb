# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

workouts = [ "pushups", "situps", "squats" ]

5.times do
  Movement.create!(
    name_of_mover: "Alec",
    type_of_movement: workouts.sample,
    reps: rand(1..100),
    weight: rand(1..50),
    created_at: Time.now - rand(1..30).days,
    updated_at: Time.now - rand(1..30).days,
  )
end

5.times do
  Movement.create!(
    name_of_mover: "Crow",
    type_of_movement: workouts.sample,
    reps: rand(1..100),
    weight: rand(1..50),
    created_at: Time.now - rand(1..30).days,
    updated_at: Time.now - rand(1..30).days,
  )
end

5.times do
  Movement.create!(
    name_of_mover: "Thomas",
    type_of_movement: workouts.sample,
    reps: rand(1..100),
    weight: rand(1..50),
    created_at: Time.now - rand(1..30).days,
    updated_at: Time.now - rand(1..30).days,
  )
end