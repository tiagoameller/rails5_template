class AddYesOrNotToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :yes_or_not, :boolean, default: false
  end
end
