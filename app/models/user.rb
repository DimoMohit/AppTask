class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :confirmable, :lockable, :timeoutable
  has_paper_trail
  has_many :blogs
  has_many :blogs,as: :favorites_of
  has_many :projects
  has_many :groups,class_name: "Product::WorkTracker::Group"
  has_many :works,class_name: "Product::WorkTracker::Work"
  has_many :votes,class_name: "Product::WorkTracker::Vote"
  after_create :create_admin
  def create_admin
    if User.count <2
      self.is_admin = true
      self.save
    end
  end
end
