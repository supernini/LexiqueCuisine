class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :lexique
      t.datetime :validated_at
      t.text :content

      t.timestamps
    end
    add_index :comments, :validated_at
    add_foreign_key(:comments, :users)
    add_foreign_key(:comments, :lexiques)
  end
end
