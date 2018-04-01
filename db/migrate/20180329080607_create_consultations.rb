class CreateConsultations < ActiveRecord::Migration[5.1]
  def change
    create_table :consultations do |t|
      t.string :cat
      t.string :x_ray
      t.string :other
      t.references :patient, index: true #foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :consultations, :patients
  end
end
