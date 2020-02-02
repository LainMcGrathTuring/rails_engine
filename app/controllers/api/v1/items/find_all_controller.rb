class Api::V1::Items::FindAllController < ApplicationController

  def index
    items = Item.where(request.query_parameters).order(:id)
    render json: ItemSerializer.new(items)
  end
end
