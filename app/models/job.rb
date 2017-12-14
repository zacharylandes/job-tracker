class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many   :comments
  belongs_to :category


  def self.level_of_interest
    group(:level_of_interest).order("count_id DESC").count(:id)
  end

  def self.locations
    group(:city).order("count_id DESC").count(:id)
  end

end
