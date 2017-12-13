class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts,  dependent: :destroy


  def self.avg_at_company
    company_avg = Company.all.group_by do |company|
      company.jobs.average(:level_of_interest).round
    end
    company_avg.reverse_each.first(3).to_h
  end
end
