class SetDefaultValueForSale < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :for_sale, :boolean, :default => true
  end
end
