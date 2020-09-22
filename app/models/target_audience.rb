class TargetAudience < ApplicationRecord
    has_many :target_audience_services, dependent: :destroy
    has_many :services, through: :target_audience_services
end
