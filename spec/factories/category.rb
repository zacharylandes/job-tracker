FactoryBot.define do
  factory :category do
    sequence(:name) {|n| "categoryName#{n}"}
  end
end
