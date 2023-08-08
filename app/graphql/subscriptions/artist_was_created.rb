module Subscriptions
  class ArtistWasCreated < Subscriptions::BaseSubscription
    argument :id, ID

    field :artist, Types::ArtistType
  
    def subscribe(id:)
      Artist.find(id)
    end
  end
end
