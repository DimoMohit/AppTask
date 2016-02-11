class CreateProductWorkTrackerGroups < ActiveRecord::Migration
  def change
    create_table :product_work_tracker_groups do |t|
      t.string :name 
      t.string :description
      t.string :subdomain
      t.belongs_to :user
      t.string :settings
      t.timestamps null: false
    end
    add_reference :product_work_tracker_works, :group,index: true
  end
end
