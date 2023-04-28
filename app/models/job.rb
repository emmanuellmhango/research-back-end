class Job < ApplicationRecord
  belongs_to :company

  validates :title, :position, :description, :required_education, :needed_skills, presence: true
end
