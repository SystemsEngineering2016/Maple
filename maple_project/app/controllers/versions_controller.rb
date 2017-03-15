class VersionsController < ApplicationController
  def new
    @system = System.find(params[:system_id])
  end

  def show
    @version = Version.find(params[:id])
  end

  def create
    @system = System.find(params[:system_id])
    @version = @system.versions.create(version_params)
    redirect_to system_path(@system)
  end

  def update
  @version =  Version.find(params[:id])

  respond_to do |format|
    if @version.update_attributes(params[:post])
      format.html { redirect_to @version, notice: 'Post was successfully updated.' }
      format.json { head :no_content } # 204 No Content
    else
      format.html { render action: "edit" }
      format.json { render json: @version.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
  @version = Version.find(params[:id])
  @version.destroy
  redirect_to systems_path

end

  private
    def version_params
      params.require(:version).permit(:Version_Name)
    end
end
