FactoryBot.define do
  factory :job do
    title "plucker"
    sequence(:level_of_interest) {|n| n}
    city "Sacramento"
    company
    category
  end
end
