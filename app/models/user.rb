class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles, dependent: :destroy
  has_one_attached :photo, service: :cloudinary

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
