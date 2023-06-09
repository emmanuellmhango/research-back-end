class Experience < ApplicationRecord
  belongs_to :user
  validates :position, :company, :date_joined, :location, presence: true
end
