class MapController < ApplicationController

def index
    @systems = System.all
  end

  def new
    @systems = System.all
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)

    @map.save
    redirect_to map_index_path
  end

  private
    def map_params
      params.require(:map).permit(:mapfrom_id, :mapto_id)
    end
end
