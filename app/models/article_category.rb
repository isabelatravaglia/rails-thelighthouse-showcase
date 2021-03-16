class ArticleCategory < ApplicationRecord
  has_many :article_categorizations, dependent: :destroy
end
