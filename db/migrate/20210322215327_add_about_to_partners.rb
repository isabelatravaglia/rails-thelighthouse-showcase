class AddAboutToPartners < ActiveRecord::Migration[6.1]
  def change
    add_column :partners, :about, :string
  end
end
