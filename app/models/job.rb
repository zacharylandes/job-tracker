class Job < ActiveRecord::Base
  validates :title, :level_of_interest, presence: true

  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :delete_all

  def self.jobs_by_level_of_interest
    group(:level_of_interest).count.sort_by {|k, v| k }
  end

end
