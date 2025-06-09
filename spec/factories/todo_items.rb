FactoryBot.define do
  factory :todo_item do
    name { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.sentence }
    completed { false }
    association :todo_list
  end
end
