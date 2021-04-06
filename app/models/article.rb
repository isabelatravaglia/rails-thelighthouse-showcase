class Article < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :photo, presence: true
  validates :article_categories, presence: true
  validates :rich_body, presence: true
  belongs_to :partner
  has_many :article_categorizations, dependent: :destroy
  has_many :article_categories, through: :article_categorizations
  has_one_attached :photo, service: :cloudinary
  before_create :set_title_param
  before_update :set_title_param
  has_rich_text :rich_body

  protected

  def set_title_param
    self.title_param = self.title.parameterize
  end
end
