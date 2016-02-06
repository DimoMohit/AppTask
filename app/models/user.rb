class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :confirmable, :lockable, :timeoutable
  has_paper_trail
  has_many :blogs
  has_many :blogs,as: :favorites_of
  after_create :create_admin
  def create_admin
    if User.count <2
      self.is_admin = true
      self.save
    end
  end
end
