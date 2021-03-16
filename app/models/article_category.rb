class ArticleCategory < ApplicationRecord
  has_many :article_categorizations
end
