require 'rails_helper'

describe Job do
  describe 'class methods' do
    it '.level_of_interest' do
        company1,company2,company3,company4 = create_list(:company,4)
        jobs1= create(:job,  company_id: company1.id)
        jobs2= create(:job,  company_id: company2.id)
        jobs3= create(:job,  company_id: company2.id)

        expect(Job.level_of_interest).to eq({9=>1, 10=>1, 11=>1})
    end
    it '.locations' do
        company1,company2,company3,company4 = create_list(:company,4)
        jobs1= create(:job,  company_id: company1.id)
        jobs2= create(:job,  company_id: company2.id)
        jobs3= create(:job,  company_id: company2.id)

        expect(Job.locations).to eq(  {"Sacramento"=>3})
    end
  end
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        science = Category.create!(id:1,name: "science")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id:1)

        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end
end
