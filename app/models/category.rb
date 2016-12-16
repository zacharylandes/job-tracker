class Category < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  belongs_to :job, :dependent => :destroy
end
