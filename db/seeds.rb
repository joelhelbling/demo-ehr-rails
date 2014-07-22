# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Patient.all.each do |patient|
  Patient.destroy(patient)
end

patients = [
  {first_name:'Amber', last_name:'Smith', date_of_birth:'10/01/1971', state:'OH'},
  {first_name:'Nathan', last_name:'Johnson', date_of_birth:'10/01/1971', state:'OH'},
  {first_name:'Amber', last_name:'Williams', date_of_birth:'10/01/1971', state:'OH'},
  {first_name:'Nathan', last_name:'Jones', date_of_birth:'10/01/1971', state:'OH'},
  {first_name:'Becky', last_name:'Brown', date_of_birth:'10/01/1971', state:'OH'},

  {first_name:'Mark', last_name:'Davis', date_of_birth:'10/01/1971', state:'OH'},
  {first_name:'Mike', last_name:'Miller', date_of_birth:'10/01/1971', state:'OH'},
  {first_name:'Amanda', last_name:'Wilson', date_of_birth:'10/01/1971', state:'OH'},
  {first_name:'Amber', last_name:'Moore', date_of_birth:'10/01/1971', state:'OH'},
  {first_name:'Amber', last_name:'Taylor', date_of_birth:'10/01/1971', state:'OH'}
  ]

patients.each do |patient|	
  Patient.create(patient)
end

Pharmacy.all.each do |pharmacy|
  Pharmacy.destroy(pharmacy)
end

pharmacies = [
  {name:'CVS Pharmacy', street:'759 Neil Ave.', city:'Columbus', state:'OH', fax:'555-555-5555', phone:'555-555-1212', zip:'43201'},
  {name:'Crosbys', street:'2609 N High St.', city:'Columbus', state:'OH', fax:'555-555-5555', phone:'555-555-1212', zip:'43201'},
  {name:'Columbus Prescription Pharms', street:'1020 High St', city:'Worthington', state:'OH', fax:'555-555-5555', phone:'555-555-1212', zip:'43201'},
  {name:'Walgreens', street:'1162 Harrisburg Pike', city:'Columbus', state:'OH', fax:'555-555-5555', phone:'555-555-1212', zip:'43201'},
  {name:'Giant Eagle', street:'1451 W 5th Ave', city:'Columbus', state:'OH', fax:'555-555-5555', phone:'555-555-1212', zip:'43201'},
  {name:'Walgreens', street:'3015 E. Livingston Ave', city:'Columbus', state:'OH', fax:'555-555-5555', phone:'555-555-1212', zip:'43201'},
  {name:'Central Ohio Compounding Pharmacy', street:'7870 Olentangy River Rd.', city:'Columbus', state:'OH', fax:'555-555-5555', phone:'555-555-1212', zip:'43201'}
]

pharmacies.each do |pharmacy|
  Pharmacy.create(pharmacy)
end