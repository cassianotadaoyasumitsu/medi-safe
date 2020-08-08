class AddSlotToNurseTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :nurse_tasks, :slot, :integer
  end
end
