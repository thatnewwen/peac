class AddRegionToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :region, :string
  end
end