# frozen_string_literal: true

module Mutations
  class CreateItem < BaseMutation
    description "Creates a new item"
    
    argument :title, String, required: true
    argument :description, String, required: false
    argument :image_url, String, required: false
    argument :artist_id, Integer, required: true

    type Types::ItemType

    def resolve(artist_id: , **attributes)
     item = Artist.find(artist_id).items.create!(attributes)
    end
  end
end
