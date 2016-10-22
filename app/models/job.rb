class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true

  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.jobs_by_level_of_interest
    group(:level_of_interest).count
  end

  def self.format_interest
    final = jobs_by_level_of_interest.map do |key, value|
      "Jobs with level of interest marked #{key}: #{value}"
    end
  end

  def self.average_level_of_interest
    group(:company_id).average(:level_of_interest).sort_by {|k, v| v }.reverse
  end

  def self.top_three_by_interest
    final = average_level_of_interest.map do |key, value|
      company = Company.find(key)
      "#{company.name}: #{value.to_f.round(2)}"
    end[0..2]
  end

end
