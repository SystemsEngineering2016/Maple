class MapController < ApplicationController
  def index
    @systems = System.all
  end
end
