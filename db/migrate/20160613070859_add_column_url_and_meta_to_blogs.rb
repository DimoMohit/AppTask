class AddColumnUrlAndMetaToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :url, :string
    add_column :blogs, :meta, :string
  end
end
