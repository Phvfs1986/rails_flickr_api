# frozen_string_literal: true

Flickr.configure do |config|
  config.api_key = ENV['flickr_api_key']
  config.shared_secret = ENV['flickr_secret']
end
