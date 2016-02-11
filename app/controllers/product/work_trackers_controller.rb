class Product::WorkTrackersController < ApplicationController
	before_filter :authenticate_user!,except: [:index]
	def index
		if user_signed_in?
			@groups=current_user.groups
		end
	end
end
