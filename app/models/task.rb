class Task < ActiveRecord::Base
  has_many :user_task_maps
  has_many :users,through: :user_task_maps
  validates :name,:description,:start_date,:end_date,:priority,presence: true
  def self.candidate_set
    User.where(id: ((User.all.pluck(:id)) - 
      (UserTaskMap.where('created_at > ?', (Date.today) - 1.day)).pluck(:user_id)) 
    ) 
  end

  # active_weight = Last Seen
  # reputation_point = Score as per his activity
  # List of people having high
  # These users are weighted in increasing order
  def best_person_for_the_task
    user_list=User.where(id: ((User.all.pluck(:id)) - 
      (UserTaskMap.where('created_at > ?', (self.start_date||Date.today) - 1.day)).pluck(:user_id)) - 
      users.pluck(:id)
    )
    if user_list.count==0
      user_list = User.all - users.pluck(:id)
    end
    repo_threshold=user_list.order(reputation: :desc).first.reputation.to_i
    best_fit=user_list.where(reputation: ((repo_threshold/2)..repo_threshold)).order(last_sign_in_at: :desc).first
    if best_fit.nil?
      best_fit=user_list.order(last_sign_in_at: :desc).first
    end
    best_fit
  end
  def is_person_feasible?(user) # Is Person Available
    
  end
  def objective?
    
  end
  def solution?
    
  end
end
