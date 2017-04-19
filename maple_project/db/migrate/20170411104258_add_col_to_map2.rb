class AddColToMap2 < ActiveRecord::Migration[5.0]
  def change
    add_column :maps, :toVersionName, :string, :after => :fromVersionName

  end
end
