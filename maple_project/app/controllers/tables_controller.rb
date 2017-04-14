class TablesController < ApplicationController
respond_to :html, :json
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
        redirect_to version_path(@version), notice: "You have successfully created the new data point."
    else
      flash.now[:error] = "Could not create the new data point. Check below for more information about the errors."
      render 'new'
    end
end


def update
  @table= Table.find(params[:id])
  @version=@table.version


  respond_to do |format|
  if @table.update_attributes(table_params)
    format.html { redirect_to(version_path(@version), :notice => 'Data point was successfully updated.') }
    format.json { respond_with_bip(@table) }
  else
    format.html { render :action => "edit" }
    format.json { respond_with_bip(@table) }
  end
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
  redirect_to version_path(@version), notice: "You have successfully deleted the data point and its associated mappings."
end


private
  def table_params
    params.require(:table).permit( :Logical_Name,:Short_Name,:Table_Name, :Column_Name, :Data_Type, :Display_Width, :Display_Height, :Display_Prompt, :Display_Short_Prompt, :Implementation_Comment, :Data_Point_Status)
  end

end
