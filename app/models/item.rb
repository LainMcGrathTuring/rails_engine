class Item < ApplicationRecord
  belongs_to :merchant

  def self.query_find(query_parameters)
    if query_parameters.keys == ["created_at"] || query_parameters.keys == ["updated_at"]
      item = Item.where(query_parameters).order(:id).first
    else
      item = Item.find_by(query_parameters)
    end
  end
end
