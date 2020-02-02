class Api::V1::Items::FindController < ApplicationController

  def index
    item = Item.query_find(request.query_parameters)
    render json: ItemSerializer.new(item)
  end
end
