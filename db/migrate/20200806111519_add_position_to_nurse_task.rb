class AddPositionToNurseTask < ActiveRecord::Migration[6.0]
  def change
    add_column :nurse_tasks, :position, :integer
  end
end
