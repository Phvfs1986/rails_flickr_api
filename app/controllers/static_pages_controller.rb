# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def index
    return unless params[:username]

    person = Flickr.people.find(params[:username])
    @photos = person.public_photos(sizes: true).map(&:medium500!)
  end
end
