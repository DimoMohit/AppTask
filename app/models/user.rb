class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email,presence: true
  has_paper_trail  
  has_many :user_task_maps
  has_many :tasks,through: :user_task_maps  
end
