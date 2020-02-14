class ChangeBookColumnTypeFromTextToString < ActiveRecord::Migration[5.1]
  def change
	change_column :books, :title, :string
	change_column :books, :author, :string
	change_column :books, :class_name, :string
	change_column :books, :ISBN, :string
  end
end
