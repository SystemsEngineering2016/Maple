class SystemsController < ApplicationController
  include SystemsHelper

  def index
   @systems = System.all
 end

  def show
    @systems = System.all
    @system = System.find(params[:id])

  end

  def new
  end

  def create
    #Strong parameters
    @system = System.new(params.require(:system).permit(:System_Name, :System_Version))

    #article.save is responsible for saving the model in the database.
    @system.save
    redirect_to @system
  end

end
