class WelcomeController < ApplicationController

  # GET /welcome
  def index
  	@blogs=Blog.last(6)
  end

end
