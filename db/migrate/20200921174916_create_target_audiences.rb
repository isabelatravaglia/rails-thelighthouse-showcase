class CreateTargetAudiences < ActiveRecord::Migration[6.0]
  def change
    create_table :target_audiences do |t|
      t.string :name
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
