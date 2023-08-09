module Subscriptions
  class ArtistWasCreated < Subscriptions::BaseSubscription
    argument :id, ID

    field :artist, Types::ArtistType, null: false, broadcastable: true
    payload_type Types::ArtistType
    
    def subscribe(id:)
      artist = Artist.find(id)
      {
        artist: artist
      }
    end
  end
end
