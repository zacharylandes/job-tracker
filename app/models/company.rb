class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.companies_by_location
    group(:city).count
  end
end
