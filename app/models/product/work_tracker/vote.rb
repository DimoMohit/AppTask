class Product::WorkTracker::Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :work,class_name: "Product::WorkTracker::Work"
end
