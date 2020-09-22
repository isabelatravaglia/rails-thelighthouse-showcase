class Service < ApplicationRecord
    has_many :partner_services, dependent: :destroy
    has_many :target_audiences, dependent: :destroy
    has_many :partners, through: :partner_services
end
