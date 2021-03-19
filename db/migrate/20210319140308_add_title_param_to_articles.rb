class AddTitleParamToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :title_param, :string
  end
end
