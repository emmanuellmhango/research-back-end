class Education < ApplicationRecord
  belongs_to :user
  validates :qualification, :university, :date_completed, :location, presence: true
end
