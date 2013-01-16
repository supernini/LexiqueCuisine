class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string      :name
      t.string      :meta_description
      t.string      :title
      t.string      :permalink
      t.text        :description
      t.has_attached_file :image
      t.timestamps
    end
  end
end
