class CreateTargetAudienceServices < ActiveRecord::Migration[6.0]
  def change
    create_table :target_audience_services do |t|
      t.references :target_audience, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
