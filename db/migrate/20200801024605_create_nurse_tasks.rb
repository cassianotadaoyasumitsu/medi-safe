class CreateNurseTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :nurse_tasks do |t|

      t.text :note
      t.boolean :completed, default: false
      t.references :task_template, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: { to_table: 'users'}
      t.references :helper_id, null: false, foreign_key: { to_table: 'users'}

      t.timestamps
    end
  end
end
