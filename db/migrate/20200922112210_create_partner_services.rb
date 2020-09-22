class CreatePartnerServices < ActiveRecord::Migration[6.0]
  def change
    create_table :partner_services do |t|
      t.references :service, null: false, foreign_key: true
      t.references :partner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
