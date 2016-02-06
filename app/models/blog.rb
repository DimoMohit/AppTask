class Blog < ActiveRecord::Base
	belongs_to :user
	belongs_to :favorites_of,polymorphic: true
end
