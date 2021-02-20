FactoryBot.define do
  factory :user do
    email { "mikeyy@gmail.com" }
    name { "Mike" }
    lastname { "Valdez" }
    password { "joemama" }
    photo {"url2/jpg.com"}
  end
end