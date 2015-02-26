class RegionsController < ApplicationController
  def index
    @region = Region.all.limit(10)
  end
end
