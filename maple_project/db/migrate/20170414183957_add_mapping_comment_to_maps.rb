class AddMappingCommentToMaps < ActiveRecord::Migration[5.0]
  def change
    add_column :maps, :map_comment, :string
  end
end
