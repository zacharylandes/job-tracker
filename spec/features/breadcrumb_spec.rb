require 'rails_helper'

describe "User can visit breadcrumb links" do
  scenario "a user visit the companies path" do
    visit root_path

    click_on"Companies"


    expect(current_path).to eq("/companies")
    expect(page).to have_content("Companies")
  end

  scenario "a user can visit the categories path" do
    visit root_path

    click_on"Categories"


    expect(current_path).to eq("/categories")
    expect(page).to have_content("Categories")
  end

  scenario "a user visit the dashboard " do
    visit root_path

    click_on"Dashboard"


    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Dashboard")

  end

  scenario "a user visit the city link in the dashboard " do
    company1,company2,company3,company4 = create_list(:company,4)
    jobs1= create(:job,  company_id: company1.id)
    jobs2= create(:job,  company_id: company1.id)
    jobs3= create(:job,  company_id: company1.id)
    jobs4= create(:job,  company_id: company2.id)
    jobs5= create(:job,  company_id: company3.id)
    jobs6= create(:job,  company_id: company4.id)

    visit '/dashboard'

    click_on "Sacramento"

    expect(page).to have_content("All jobs in Sacramento")

  end

  scenario "a user visit the jobs by city link in the dashboard " do
    company = create(:company, id:1)
    jobs1= create(:job,  company_id: company.id)
    jobs2= create(:job,  company_id: company.id)
    jobs3= create(:job,  company_id: company.id)
    jobs4= create(:job,  company_id: company.id)
    jobs5= create(:job,  company_id: company.id)
    jobs6= create(:job,  company_id: company.id)

    visit root_path

    click_on "Jobs by Location"

    expect(page).to have_content("All jobs by city")
  end
end
