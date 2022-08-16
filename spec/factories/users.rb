FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@email.com" }
    password { 'secret' }
    confirmed_at { Time.zone.now }
  end
end
