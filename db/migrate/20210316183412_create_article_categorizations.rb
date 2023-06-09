class CreateArticleCategorizations < ActiveRecord::Migration[6.1]
  def change
    create_table :article_categorizations do |t|
      t.references :article, null: false, foreign_key: true
      t.references :article_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
