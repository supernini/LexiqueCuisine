class CreateLexiques < ActiveRecord::Migration
  def change
    create_table :lexiques do |t|
      t.string      :title
      t.string      :permalink
      t.string      :name
      t.string      :short_description
      t.string      :meta_description
      t.text        :description
      t.text        :keywords
      t.datetime    :published_at
      t.text        :family
      t.text        :synonyme
      t.references  :category
      t.boolean     :courant, :default => false
      t.has_attached_file :image
      t.timestamps
    end
    add_index :lexiques, :published_at
    add_foreign_key(:lexiques, :categories)
  end
end
