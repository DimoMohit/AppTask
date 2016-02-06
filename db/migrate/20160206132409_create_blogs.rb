class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.belongs_to :user
      t.belongs_to :favorites_of,polymorphic: true
      t.string :header
      t.string :sub_header
      t.string :blog_content
      t.float :popularity_index
      t.integer :read_by
      t.boolean :publish
      t.timestamps null: false
    end
  end
end
