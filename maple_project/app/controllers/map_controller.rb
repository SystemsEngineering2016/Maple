class MapController < ApplicationController

def index
    @maps = Map.all
  end

  def new
    @systems = System.all
    @map = Map.new
  end

  def create
    @systems = System.all
    @map = Map.new(map_params)
  if @map.save
    redirect_back(fallback_location: root_path,notice: "You have successfully created a new mapping.")
  else
    # flash.now[:error] = "Could not save mapping. Check below for errors."
    # render 'new'
    redirect_to :back, :flash => { :error => @map.errors.full_messages.to_sentence }

  end
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Map.find(params[:id])

  if @map.update(system_params)
    redirect_to @map
  else
    render 'edit'
  end
  end



def destroy
  @map = Map.find(params[:id])
  @map.destroy
  redirect_back(fallback_location: root_path,notice: "You have successfully deleted the mapping.")

end

  private
    def map_params
      params.require(:map).permit(:mapfrom_id, :mapto_id, :fromVersionName, :toVersionName, :map_comment)
    end
end
