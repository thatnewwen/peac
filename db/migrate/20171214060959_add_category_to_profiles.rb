class AddCategoryToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :category, :string
  end
end
