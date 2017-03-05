class TablesController < ApplicationController
  def new
    @table = Table.find(params[:table_id])
  end

  def create
    @version = Version.find(params[:version_id])
    @table = @table.tables.create(table_params)
    redirect_to table_path(@table)
  end

end
