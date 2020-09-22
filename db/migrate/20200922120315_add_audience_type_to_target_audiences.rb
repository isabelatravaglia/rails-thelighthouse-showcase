class AddAudienceTypeToTargetAudiences < ActiveRecord::Migration[6.0]
  def change
    add_column :target_audiences, :audience_type, :string
  end
end
