# frozen_string_literal: true

require 'rails_helper'

describe TaypiSchema do
  subject(:query_response) { described_class.execute(query, variables: variables) }
  let(:variables) {{}}

  describe 'artist with variables' do
    let!(:item){ create(:item) }
    let(:artist) { item.artist }
    let(:query) do
      <<~GQL
      query getArtist($id: ID!) {
        artist(id: $id) {
          firstName
          lastName
          items {
            id
            title
            description
          }
        }
      }
      GQL
    end

    let(:variables) { {"id": item.artist.id} }

    it 'return artist and his items' do
      expect(subject.to_h).to eq({
        "data" => {
          "artist"=>[{"firstName"=>artist.first_name, "items"=>[{"description"=>item.description, "id"=>item.id.to_s, "title"=>item.title}], "lastName"=>artist.last_name}]
        }
      })
    end
  end

  describe 'when return error' do
    let(:query) do
      <<~GQL
      query getArtist($id: ID!) {
        artist(id: $id) {
          firstName
          lastName
        }
      }
      GQL
    end

    let(:variables) { {"id": 0} }

    it 'return error mesagge' do
      expect(subject.to_h).to eq({
        "data"=>{"artist"=>nil}, "errors"=>[{"locations"=>[{"column"=>3, "line"=>2}], "message"=>"Artist not found", "path"=>["artist"]}]
      })
    end
  end
end
