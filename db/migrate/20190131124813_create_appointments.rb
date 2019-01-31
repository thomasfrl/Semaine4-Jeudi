class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :date
      t.belongs_to :patient
      t.belongs_to :doctor
    end
  end
end
