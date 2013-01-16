class AddFirstLetterToLexique < ActiveRecord::Migration
  def change
    add_column :lexiques, :first_letter, :string, :limit => 1
  end
end
