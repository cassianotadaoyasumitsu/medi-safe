class AddEmrIdToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :emr_id, :string
  end
end
