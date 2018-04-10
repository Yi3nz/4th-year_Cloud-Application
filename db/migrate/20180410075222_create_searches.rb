class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.date :date_of_birth
      t.string :address
      t.integer :phone_no
      t.string :infection
      t.string :injury
      t.integer :min_consultation
      t.integer :max_consultation

      t.timestamps
    end
  end
end
