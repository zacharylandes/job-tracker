class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts, dependent: :delete_all

  def self.companies_by_location
    all.group_by(&:city)
  end

end
