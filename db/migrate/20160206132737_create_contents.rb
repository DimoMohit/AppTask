class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :ownerable, polymorphic: true, index: true
      t.attachment :attachment
      t.string :scope
      t.string :priority
      t.timestamps null: false
    end
  end
end
