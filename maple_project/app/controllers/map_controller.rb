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


def destroy
  @map = Map.find(params[:id])
  @map.destroy

  redirect_to map_index_path
end

  private
    def map_params
      params.require(:map).permit(:mapfrom_id, :mapto_id)
    end
end
