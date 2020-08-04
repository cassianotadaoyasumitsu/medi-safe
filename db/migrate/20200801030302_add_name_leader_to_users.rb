class AddNameLeaderToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_reference :users, :leader, foreign_key: { to_table: :users }
  end
end
