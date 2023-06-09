class Company < ApplicationRecord
    has_many :jobs

    validates :name, :phone, :email, :password, presence: true
end
