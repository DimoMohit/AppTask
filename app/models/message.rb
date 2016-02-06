class Message < ActiveRecord::Base
  include ActiveModel::Validations
  include ErrorHumanizeModule
  validates :name,:email, presence: {strict: false},length: { minimum: 2 ,message: "%{value} is not a valid size"}
  validates :email,email: true
  validates :msg,length: { maximum: 200 ,message: "is too long."}
  after_create :verify_email

  def verify_email
  	data={name: self.name,email: self.email}
  	NotificationMailer.send_message(data).deliver_now!
  end
end