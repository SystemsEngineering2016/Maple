class TablesController < ApplicationController
  def create
    @version = Version.find(params[:version_id])
    @table = @version.tables.new(table_params)
    redirect_to version_path(@version)
end

private
  def comment_params
    params.require(:table).permit( :Table_Name, :Column_Name, :Data_Type, :Display_Width, :Display_Height, :Display_Prompt, :Display_Short_Prompt, :Implementation_Comment)
  end

end
