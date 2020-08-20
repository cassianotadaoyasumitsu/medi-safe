class AddStartTimeToNurseTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :nurse_tasks, :start_time, :Time
  end
end
