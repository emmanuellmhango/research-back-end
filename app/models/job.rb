class Job < ApplicationRecord
  belongs_to :company
  has_many :jobapplications

  validates :title, :position, :description, :required_education, :needed_skills, presence: true
end
