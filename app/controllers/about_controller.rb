class AboutController < ApplicationController
  def about
    @about = About.first
  end
end
