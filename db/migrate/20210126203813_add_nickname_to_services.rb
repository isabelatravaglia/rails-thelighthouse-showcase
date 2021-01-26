class AddNicknameToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :nickname, :string
  end
end
