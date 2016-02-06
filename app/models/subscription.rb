class Subscription < ActiveRecord::Base
  include ActiveModel::Validations
  include ErrorHumanizeModule
  validates :name,:email, presence: {strict: false},length: { minimum: 2 ,message: "%{value} is not a valid size"}
  validates :email,email: true
  has_many :blogs,as: :favorites_of
end
