require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(id:1,name: "science")

    visit edit_category_path(category)

    fill_in "category[name]", with: "Flippity Flopper"

    click_button "Update Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Flippity Flopper")
  end
end
