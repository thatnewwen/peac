class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :university
    	t.integer :graduation_year
    	t.string :company
    	t.string :location
    	t.string :gender
    	t.string :start_date
    	

      t.timestamps
    end
  end
end
