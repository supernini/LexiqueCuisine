class AddHomeViewToLexique < ActiveRecord::Migration
  def change
    add_column :lexiques, :home_view, :integer, :default => 0
  end
end
