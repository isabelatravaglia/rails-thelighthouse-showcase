class AddHpShowToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :hp_show, :boolean
  end
end
