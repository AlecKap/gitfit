FactoryBot.define do
  factory :movement do
    name_of_mover { Faker::Name.name }
    type_of_movement { Faker::Lorem.word }
    reps { Faker::Number.between(from: 1, to: 50) }
    weight { Faker::Number.between(from: 5, to: 50) }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end