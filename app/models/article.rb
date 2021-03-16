class Article < ApplicationRecord
  belongs_to :partner
  has_many :article_categorizations
  has_many :article_categories, through: :article_categorizations
end
