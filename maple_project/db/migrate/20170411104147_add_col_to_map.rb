class AddColToMap < ActiveRecord::Migration[5.0]
  def change
    add_column :maps, :fromVersionName, :string, :after => :mapto_id

  end
end
