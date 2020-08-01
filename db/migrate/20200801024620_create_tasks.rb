class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|

      t.string :description
      t.string :note
      t.boolean :completed
      t.references :user, null: false, foreign_key: true
      t.references :task_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
