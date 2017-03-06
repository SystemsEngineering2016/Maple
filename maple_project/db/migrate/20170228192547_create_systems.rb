class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.string :System_Name

      t.timestamps
    end
  end
end
