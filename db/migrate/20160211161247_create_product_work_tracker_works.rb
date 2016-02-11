class CreateProductWorkTrackerWorks < ActiveRecord::Migration
  def change
    create_table :product_work_tracker_works do |t|
      t.belongs_to :user
      t.belongs_to :owner,polymorphic: true
      t.string :name
      t.float :weight
      t.timestamps null: false
    end
  end
end
