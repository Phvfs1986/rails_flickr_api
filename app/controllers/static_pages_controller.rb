# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def index
    @flickr = Flickr.new(ENV['flickr_api_key'], ENV['flickr_secret'])
    return unless params[:username]

    @response = @flickr.people.getInfo user_id: params[:username]
    @photos = @flickr.people.getPhotos user_id: @response['nsid']
  rescue StandardError => e
    flash[:notice] = "#{e.message.last(14)}! Please check if User ID is correct."
    redirect_to root_path
  end
end
