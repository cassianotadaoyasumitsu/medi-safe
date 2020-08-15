class AddActiveToNurseTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :nurse_tasks, :active, :boolean, default: false
  end
end
