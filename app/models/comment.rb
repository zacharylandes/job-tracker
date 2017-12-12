class Comment < ApplicationRecord
  validates :content, presence: true, uniqueness: true
  belongs_to :job, dependent: :destroy
end
