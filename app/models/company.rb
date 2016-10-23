class Company < ActiveRecord::Base
  validates :name, :city, presence: true
  validates :name, uniqueness: true
  has_many :jobs
  has_many :contacts, dependent: :delete_all


  def self.jobs_by_location
    grouped = all.group_by(&:city)
    count_jobs_in_location(grouped)
  end

  def self.count_jobs_in_location(input)
    location_with_count = input.map do |location, companies|
      total = 0
      companies.each do |company|
        total += company.jobs.count
      end
      @total = total
      @location = location
      [@location, @total]
    end
  end

  def self.top_three_by_interest
    joins(:jobs).
    group(:name).
    order("AVG(jobs.level_of_interest) DESC").
    limit(3).
    pluck(:name, "AVG(jobs.level_of_interest)")
  end

end
