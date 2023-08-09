# frozen_string_literal: true

require 'rails_helper'

describe TaypiSchema do
  subject(:query_response) { described_class.execute(query, variables: variables) }
  let(:variables) {{}}

  describe 'artists' do
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
    let!(:artist) { create(:artist) }

    it 'return artists' do
      expect(subject.to_h).to eq({
        "data" => {
          "artists"=>[{"firstName"=>artist.first_name, "id"=>artist.id.to_s, "lastName"=>artist.last_name}]
        }
      })
    end
  end
end