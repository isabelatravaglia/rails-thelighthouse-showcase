class AddCourseToServices < ActiveRecord::Migration[6.1]
  def change
    add_column :services, :course, :boolean
  end
end
