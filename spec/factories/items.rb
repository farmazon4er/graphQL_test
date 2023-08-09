require 'ffaker'

FactoryBot.define do
  factory :item do
    association :artist
    title  { FFaker::Music.album } 
    description { FFaker::Music.genre }
    image_url { FFaker::Image.url }
  end
end
