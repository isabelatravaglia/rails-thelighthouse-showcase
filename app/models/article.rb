class Article < ApplicationRecord
  validates :title, uniqueness: true
  belongs_to :partner
  has_many :article_categorizations, dependent: :destroy
  has_many :article_categories, through: :article_categorizations, dependent: :destroy
end
