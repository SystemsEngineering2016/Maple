class VersionsController < ApplicationController
  def new
    @system = System.find(params[:system_id])
      @version = Version.new  end

  def show
    @version = Version.find(params[:id])
  end

  def edit
  @version = Version.find(params[:id])
  end

  def create
    @system = System.find(params[:system_id])
    @version = @system.versions.create(version_params)
    if @version.save
        redirect_to @version
    else
      render 'new'
    end
    end

  def update
  @version = Version.find(params[:id])
  if @version.update(version_params)
    redirect_to @version
  else
    render 'edit'
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
