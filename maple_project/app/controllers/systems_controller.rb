class SystemsController < ApplicationController
  def index
  @systems = System.all
end

  def show
  @system = System.find(params[:id])
  end

  def new
    @system = System.new
  end

  def edit
  @system = System.find(params[:id])
end

  def create
    @system = System.new(system_params)

    if @system.save
      redirect_to @system
    else
      render 'new'
    end
  end

  def update
  @system = System.find(params[:id])

  if @system.update(system_params)
    redirect_to @system
  else
    render 'edit'
  end
  end


def destroy
  @system = System.find(params[:id])
  @system.destroy

  redirect_to systems_path
end

  private
  def system_params
    params.require(:system).permit(:System_Name)
  end

end
