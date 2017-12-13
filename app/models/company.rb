class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts,  dependent: :destroy


  def self.avg_interest_at_company
    company_avg = Company.all.group_by do |company|
    company.jobs.average(:level_of_interest).round
    end
  end


  def self.top_three_by_interest
    avg_interest_at_company.sort_by {|key, value| key}.reverse.first(3)
  end

end
