class Product::WorksController < ApplicationController
	before_filter :authenticate_user!
end
