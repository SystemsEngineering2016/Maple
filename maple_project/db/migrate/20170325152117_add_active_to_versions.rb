class AddActiveToVersions < ActiveRecord::Migration[5.0]
  def change
    add_column :versions, :active, :boolean
  end
end
