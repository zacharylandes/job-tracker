require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    # category = Company.create!(name: "ESPN")
    category = Category.create!(id:1,name: "science")
    # category.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: 1)
    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("science")
  end
end
