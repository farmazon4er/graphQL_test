module Types
  class SubscriptionType < Types::BaseObject
    field :artist_was_created, subscription: Subscriptions::ArtistWasCreated, broadcastable: true
  end
end
