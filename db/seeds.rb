# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'bundler'
Bundler.require

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'doctors'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'patients'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'appointments'")

10.times do 
    d = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, speciality: Faker::Job.title, postal_code: Faker::Code.asin)
    p = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

40.times do 
    a = Appointment.create(date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today), doctor_id: Doctor.all.sample.id, patient_id: Patient.all.sample.id)
end