class Partner < ApplicationRecord
    has_many :partner_services, dependent: :destroy
    has_many :services, through: :partner_services
    has_many :articles, dependent: :destroy
end
