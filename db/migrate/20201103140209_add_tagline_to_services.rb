class AddTaglineToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :tagline, :string
  end
end
