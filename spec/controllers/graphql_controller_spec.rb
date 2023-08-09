# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  describe "#execute" do
    let!(:artist) { create(:artist) }

    let(:query) do 
      <<~GQL
      { artists {
          id
          firstName
          lastName
        }
      }
    GQL
    end

    subject { post(:execute, params: { query: query }) }

    it 'return artists' do
      subject
      expect(JSON.parse(response.body)).to eq({
        "data" => {
          "artists"=>[{"firstName"=>artist.first_name, "id"=>artist.id.to_s, "lastName"=>artist.last_name}]
        }
      })
    end
  end
end