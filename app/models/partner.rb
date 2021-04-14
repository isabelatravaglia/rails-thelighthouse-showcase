class Partner < ApplicationRecord
  has_many :partner_services, dependent: :destroy
  has_many :services, through: :partner_services
  # has_many :articles, dependent: :destroy
  has_one_attached :photo, service: :local

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
