FactoryBot.define do
  factory :post do
    title { "MyString" }
    body { "MyText" }
    public { false }
    user { nil }
    category { nil }
  end
end
