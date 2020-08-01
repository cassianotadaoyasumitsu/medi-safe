class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|

      t.string :name
      t.string :gender
      t.string :age
      t.string :severity
      t.string :room
      t.string :bed
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
