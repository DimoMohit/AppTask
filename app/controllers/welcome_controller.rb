class WelcomeController < ApplicationController

  # GET /welcome
  def index
  	@blogs=Blog.last(6)
  	@projects = Project.order(id: :desc)
  end

end
