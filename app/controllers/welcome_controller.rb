class WelcomeController < ApplicationController

  # GET /welcome
  def index
  	@blogs=Blog.where(publish: true).last(6)
  	@projects = Project.order(id: :desc)
  end

end
