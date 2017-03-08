class TablesController < ApplicationController
  def new
    @version = Version.find(params[:version_id])
  end

  def show
      @version = Version.find(params[:version_id])
  end

  def create
    @version = Version.find(params[:version_id])
    @table = @version.table.create(table_params)
    redirect_to version_path(@version)
end

def destroy
@table = Table.find(params[:id])
@table.destroy
redirect_to systems_path

end



private
  def table_params
    params.require(:table).permit( :Table_Name, :Column_Name, :Data_Type, :Display_Width, :Display_Height, :Display_Prompt, :Display_Short_Prompt, :Implementation_Comment)
  end

end
