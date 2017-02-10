class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.string :System_Name
      t.text :System_Version

      t.timestamps
    end
  end
end
