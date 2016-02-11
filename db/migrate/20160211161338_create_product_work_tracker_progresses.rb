class CreateProductWorkTrackerProgresses < ActiveRecord::Migration
  def change
    create_table :product_work_tracker_progresses do |t|
      t.belongs_to :user
      t.belongs_to :work
      t.integer :current_state
      t.integer :final_state
      t.integer :current_worker
      t.string :workers_sequence
      t.integer :weight
      t.timestamps null: false
    end

    add_column :users, :role, :string
    add_column :users, :weight, :float  
    add_column :users, :rank, :integer
  end
end
