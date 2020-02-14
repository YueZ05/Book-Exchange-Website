class AddMoreColumnsToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :condition, :string
    add_column :books, :description, :text
    add_column :books, :for_sale, :boolean
    add_column :books, :quantity, :integer
  end
end
