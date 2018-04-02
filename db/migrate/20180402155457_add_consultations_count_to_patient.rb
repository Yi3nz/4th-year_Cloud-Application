class AddConsultationsCountToPatient < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :consultations_count, :integer, :default => 0
  end
end
