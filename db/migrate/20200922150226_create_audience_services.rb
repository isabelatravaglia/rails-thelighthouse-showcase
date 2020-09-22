class CreateAudienceServices < ActiveRecord::Migration[6.0]
  def change
    create_table :audience_services do |t|
      t.references :audience, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
