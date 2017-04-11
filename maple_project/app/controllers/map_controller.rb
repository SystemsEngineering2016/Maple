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
    redirect_to map_index_path
  else
     render 'new'
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

  redirect_to map_index_path
end

  private
    def map_params
      params.require(:map).permit(:mapfrom_id, :mapto_id, :fromVersionName, :toVersionName)
    end
end
