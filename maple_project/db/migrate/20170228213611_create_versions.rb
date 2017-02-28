class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|
      t.string :Version_Name
      t.references :system, foreign_key: true

      t.timestamps
    end
  end
end
