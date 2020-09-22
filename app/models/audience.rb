class Audience < ApplicationRecord
    has_many :audience_services, dependent: :destroy
    has_many :services, through: :audience_services
end
