class Product::WorkTracker::Work < ActiveRecord::Base
  belongs_to :user
  belongs_to :group,class_name: "Product::WorkTracker::Group"
  belongs_to :owner,polymorphic: true
end
