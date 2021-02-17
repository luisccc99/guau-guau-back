FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name.split()[0] }
    lastname { Faker::Name.name.split()[1] }
    password { "joemama" }
  end
end