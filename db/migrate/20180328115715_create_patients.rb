class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :date_of_birth
      t.string :address
      t.integer :phone_no
      t.string :infection
      t.string :injury
      t.string :special_observation

      t.timestamps
    end
  end
end
