class AddSpecialityIndexToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :speciality, foreign_key: true
  end
end
