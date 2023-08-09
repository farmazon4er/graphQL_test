# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateArtist do
  let(:schema) { TaypiSchema }
  subject { schema.execute(mutation, variables: variables) }
  let(:variables) { {} }

  describe "#resolve" do
    let!(:mutation) do 
      <<~GQL
      mutation createArtist($firstName: String!, $lastName: String!) {
        createArtist(input: {firstName: $firstName, lastName: $lastName}) {
          id
          firstName
          lastName
        }
      }
      GQL
    end

    let!(:variables) { {"firstName": "Jonh", "lastName": "Snow"} }

    it 'create new artist' do
      expect { subject }.to change {Artist.count}.by(1)
      artist = Artist.last
      expect(subject.to_h).to eq({
        "data"=>{"createArtist"=>{"firstName"=>artist.first_name, "id"=>artist.id.to_s, "lastName"=>artist.last_name}}
      }) 
    end
  end
end