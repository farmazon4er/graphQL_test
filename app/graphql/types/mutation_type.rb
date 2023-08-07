module Types
  class MutationType < Types::BaseObject
    field :create_artist, mutation: Mutations::CreateArtist
    field :create_item, mutation: Mutations::CreateItem
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    # def artist_create
    #   binding.pry
    # end
  end
end
