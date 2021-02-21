require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name.split[0]}
    lastname { Faker::Name.name.split[1] }
    password { "joemama" }
    photo {"url2/jpg.com"}
  end
end