class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|
      t.references :mapfrom
      t.references :mapto
    end
  end
end
