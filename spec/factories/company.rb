FactoryBot.define do
  factory :company do
    # name "Jojos"
    sequence(:name) {|n| "CompanyName#{n}"}
  end
end
