FactoryBot.define do
  factory :post do
    title { "MyString" }
    body { "MyText with some additional chars" }
    public { false }
    user { nil }
    category { nil }
  end
end
