class SystemsController < ApplicationController
  def index
  @systems = System.all
  if params[:search]
    @systems = System.search(params[:search]).order("System_Name ASC")
  else
    @systems = System.all.order('System_Name ASC')
  end
end

  def show
  @system = System.find(params[:id])
  end

  def show2
  @system = System.find(params[:id])
  end

  def newShow
  @system = System.find(params[:id])
  end


  def new
    @system = System.new
  end

  def edit
    @system = System.find(params[:id])
  end

  def version_view
    @systems = System.all
  end

  def create
    @system = System.new(system_params)

    if @system.save
      # redirect_to @system
      redirect_to systems_path,notice: "You have successfully created a new system."
    else
      flash.now[:error] = "Could not create the new system. Check below for errors."
      render 'new'
    end
  end

  def update
  @system = System.find(params[:id])

  if @system.update(system_params)
    # redirect_to @system
    redirect_to systems_path, notice: "You have successfully updated the system name."
  else
    flash.now[:error] = "Could not update system name. Check below for errors."
    render 'edit'
  end
  end


  def destroy
    @system = System.find(params[:id])
    @system.destroy

    redirect_to systems_path,notice: "You have successfully deleted the system and all its associated versions, data points and mappings."
  end

  private
  def system_params
    params.require(:system).permit(:System_Name)
  end


  def create_version
     @systems = System.all
  end

end
