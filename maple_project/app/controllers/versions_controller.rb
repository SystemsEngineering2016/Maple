class VersionsController < ApplicationController
  def new

    @system = System.find(params[:system_id])
  end

  def show
    @system = System.find(params[:system_id])
  end

  def upload
    uploaded_io = params[:system][:csvFile]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

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
