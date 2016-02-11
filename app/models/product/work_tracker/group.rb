class Product::WorkTracker::Group < ActiveRecord::Base
	belongs_to :user
	has_many :works, class_name: "Product::WorkTracker::Work"
end
