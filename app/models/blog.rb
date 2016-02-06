class Blog < ActiveRecord::Base
  include ActiveModel::Validations
  include ErrorHumanizeModule
  belongs_to :user
  belongs_to :favorites_of,polymorphic: true
  validates :header,:sub_header,:blog_content, presence: true,length: { minimum: 2 ,message: "%{value} is not a valid size"}

end
