class VersionsController < ApplicationController
respond_to :html, :json
  def new
    @system = System.find(params[:system_id])
    @version = Version.new
  end

  def show
    @version = Version.find(params[:id])
    @system=@version.system
  end

  def show2
    @version = Version.find(params[:id])
  end

  def show3
    @version = Version.find(params[:id])
  end

  def edit
    @version = Version.find(params[:id])
    @system=@version.system
  end

  def create
    @system = System.find(params[:system_id])
    @version = @system.versions.create(version_params)
    if @version.save
        redirect_to system_path(@system), notice: "You have successfully created the new version."
    else
      flash.now[:error] = "Could not create the new version. Check below for more information about the errors."
      render 'new'
    end
  end

  def update
    @version = Version.find(params[:id])
    @system=@version.system
    if @version.update(version_params)
      redirect_to system_path(@system), notice: "You have successfully updated the version."
    else
      flash.now[:error] = "Could not update the version. Check below for more information about the errors."
      render 'edit'
    end
  end


  def destroy
    @version = Version.find(params[:id])
    @system=@version.system
    @version.destroy
    redirect_to system_path(@system), notice: "You have successfully deleted the version and its associated data points and mappings."
  end

  private
    def version_params
      params.require(:version).permit(:Version_Name, :active)
    end
end
