class AddStructureToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :structure, :text
  end
end
