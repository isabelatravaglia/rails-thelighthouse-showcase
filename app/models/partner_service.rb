class PartnerService < ApplicationRecord
  belongs_to :service
  belongs_to :partner
end
