class CreateProductWorkTrackerVotes < ActiveRecord::Migration
  def change
    create_table :product_work_tracker_votes do |t|
      t.belongs_to :user
      t.belongs_to :work
      t.float :vote_point
      t.timestamps null: false
    end
  end
end
