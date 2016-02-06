class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :email
      t.text :message
      t.integer :blog_count
      t.integer :favorite_blogs
      t.string :confirmation_token
      t.string :confirmed_at
      t.timestamps null: false
    end
  end
end
