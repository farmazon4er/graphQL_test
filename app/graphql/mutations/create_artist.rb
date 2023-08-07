# frozen_string_literal: true

module Mutations
  class CreateArtist < BaseMutation
    description "Creates a new artist"
    
    argument :first_name, String, required: true
    argument :last_name, String, required: true

    type Types::ArtistType

    def resolve(first_name:, last_name: )
      artist = Artist.create!(first_name: first_name, last_name: last_name)
    end
  end
end
