class Project < ActiveRecord::Base
  include ActiveModel::Validations
  include ErrorHumanizeModule
  belongs_to :user
  validates :name,:sub_header,:url,:description, 
  presence: true,
  length: { minimum: 2 ,message: "%{value} is not a valid size"}
  validates :name,uniqueness: true
end
