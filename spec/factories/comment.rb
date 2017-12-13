FactoryBot.define do
  factory :comment do
    sequence(:content) {|n| "categoryName#{n}"}

    # content "commenty comment"
    job
    # company
    # category
  end
end
