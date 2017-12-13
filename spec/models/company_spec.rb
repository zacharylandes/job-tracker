require 'rails_helper'

describe Company do
    describe 'class methods' do

      it '.avg interest at company' do

        company1,company2,company3,company4 = create_list(:company,4)
        jobs1= create(:job,  company_id: company1.id)
        jobs2= create(:job,  company_id: company2.id)
        jobs3= create(:job,  company_id: company2.id)
        jobs4= create(:job,  company_id: company3.id)
        jobs5= create(:job,  company_id: company4.id)

        expect(Company.avg_interest_at_company.keys).to eq([16, 18, 19, 20])

        # byebug
      end

      it '.avg at company' do

        company1,company2,company3,company4 = create_list(:company,4)
        jobs1= create(:job,  company_id: company1.id)
        jobs2= create(:job,  company_id: company2.id)
        jobs3= create(:job,  company_id: company2.id)
        jobs4= create(:job,  company_id: company3.id)
        jobs5= create(:job,  company_id: company4.id)

        expect(Company.top_three_by_interest.count).to eq(3)

      end
    end
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
  end
end
