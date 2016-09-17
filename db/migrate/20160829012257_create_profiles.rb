class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :university
    	t.integer :graduation_year
    	t.string :company
    	t.string :current_location
    	t.string :gender
    	t.string :start_date_current
      t.string :start_date_pe
    	t.string :industry_preference_first
      t.string :industry_preference_second
      t.string :industry_preference_third

      t.timestamps
    end
  end
end
