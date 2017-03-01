class VersionsController < ApplicationController
  def create
    @system = System.find(params[:system_id])
    @version = @system.versions.create(version_params)
    redirect_to system_path(@system)
  end

  def destroy
  @system = System.find(params[:system_id])
  @version = @system.versions.find(params[:id])
  @version.destroy
  redirect_to system_path(@system)
end

  private
    def version_params
      params.require(:version).permit(:Version_Name)
    end
end
