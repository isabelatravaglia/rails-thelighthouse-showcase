class Service < ApplicationRecord
    has_many :partner_services, dependent: :destroy
    has_many :audience_services, dependent: :destroy
    has_many :partners, through: :partner_services
    has_many :audiences, through: :audience_services
    has_one_attached :photo, service: :local
end
