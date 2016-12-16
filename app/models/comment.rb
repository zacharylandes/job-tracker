class Comment < ActiveRecord::Base
  validates :content, presence: true
  validates :content, uniqueness: true
  belongs_to :job
end
