class UserTaskMap < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  validates :user_id,:task_id,presence: true
  validates :user_id,uniqueness: {scope: :task_id,message: ' can work only once on a task.'}
end
