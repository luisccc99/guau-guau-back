FactoryBot.define do
  factory :user do
    email { "luisccc99@gmail.com" }
    name { "Luis" }
    lastname { "Cruz" }
    password { "joemama" }
    photo {"url/jpg.com"}
  end
end