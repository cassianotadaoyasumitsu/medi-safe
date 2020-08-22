class AddOnShiftToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :on_shift, :boolean, default: false
  end
end
