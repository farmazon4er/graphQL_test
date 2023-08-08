module Types
  class SubscriptionType < Types::BaseObject
    field :artist_was_created, subscription: Subscriptions::ArtistWasCreated
  end
end
