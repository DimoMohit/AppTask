class UserTaskMap < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  validates :user_id,:task_id,presence: true
end
