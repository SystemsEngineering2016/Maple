class AddDisplayHeight < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :Display_Height, :integer, :after => :Display_Width
  end
end
