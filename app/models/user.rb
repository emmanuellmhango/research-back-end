class User < ApplicationRecord
    has_one :biodata
    has_many :educations
    has_many :experiences
    has_many :skills
    has_one :profiles
end
