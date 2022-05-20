class AddDateToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :bod, :date
  end
end
