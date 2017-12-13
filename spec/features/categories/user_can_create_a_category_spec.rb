require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit categories_path

    click_on"Add a Category"

    fill_in "category[name]", with: "ESPN"

    click_on "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("ESPN")
    expect(Category.count).to eq(1)
    
  end
end
