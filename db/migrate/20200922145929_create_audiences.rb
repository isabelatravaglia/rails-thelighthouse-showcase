class CreateAudiences < ActiveRecord::Migration[6.0]
  def change
    create_table :audiences do |t|
      t.string :name
      t.text :description
      t.string :audience_type

      t.timestamps
    end
  end
end
