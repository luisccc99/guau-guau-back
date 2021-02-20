=begin
FactoryBot.define do
  factory :post do   
    association :user, factory: :user
  end
end
=end