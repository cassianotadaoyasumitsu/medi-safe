class CreateTaskTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :task_templates do |t|

      t.integer :frequency
      t.boolean :active, default: true
      t.references :patient, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
