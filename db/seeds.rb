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
City.destroy_all
Speciality.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'doctors'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'patients'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'appointments'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cities'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'specialities'")

2.times do 
    c = City.create(name: Faker::Nation.capital_city)
end

4.times do 
    c = Speciality.create(name: Faker::Job.title)
end

10.times do 
    d = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, speciality_id: Speciality.all.sample.id, postal_code: Faker::Code.asin, city_id: City.all.sample.id)
    p = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
end

40.times do 
    a = Appointment.create(date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today), doctor_id: Doctor.all.sample.id, patient_id: Patient.all.sample.id, city_id: City.all.sample.id)
end

