class Contact < ApplicationRecord
  validates :name, :email, :position , uniqueness: true
  belongs_to :company
end
