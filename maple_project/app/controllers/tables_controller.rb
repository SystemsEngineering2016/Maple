class TablesController < ApplicationController
  def new
    @version = Version.find(params[:version_id])
  end

  def show
      @version = Version.find(params[:version_id])
  end

  def edit
    # @table = @version.table.find(params[:id])
    @table = Table.find(params[:id])
  end

  def create
    @version = Version.find(params[:version_id])
    @table = @version.table.create(table_params)
    if @table.save
        redirect_to version_path(@version)
    else
      render 'new'
    end
end




def update

  @table = Table.find(params[:id])
  if @table.update(table_params)
    redirect_to @table
  else
    render 'edit'
  end


# respond_to do |format|
#
#     if @version.table.update(params[table_params])
#
#
#       format.html { redirect_to @version.table, notice: 'PartInfo was successfully updated.' }
#
#       format.json { head :no_content }
#
#     else
#
#       format.html { render action: "edit" }
#
#       format.json { render json: @version.table.errors, status: :unprocessable_entity }
#
#     end
#
# end

end


def destroy
  @table = Table.find(params[:id])
  @version=@table.version
  @table.destroy
  redirect_to version_path(@version)
end


private
  def table_params
    params.require(:table).permit( :Longest_Name,:Short_Name,:Table_Name, :Column_Name, :Data_Type, :Display_Width, :Display_Height, :Display_Prompt, :Display_Short_Prompt, :Implementation_Comment)
  end

end
