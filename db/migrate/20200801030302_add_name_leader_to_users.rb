class AddNameLeaderToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :leader, :boolean, default: false
    add_column :users, :leader_id, :integer, foreign_key: true
  end
end
