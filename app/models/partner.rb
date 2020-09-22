class Partner < ApplicationRecord
    has_many :partner_services, dependent: :destroy
    has_many :services, through: :partner_services
end
