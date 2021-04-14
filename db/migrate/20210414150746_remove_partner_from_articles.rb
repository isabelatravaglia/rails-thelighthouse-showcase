class RemovePartnerFromArticles < ActiveRecord::Migration[6.1]
  def change
    remove_reference :articles, :partner, null: false, foreign_key: true
  end
end
