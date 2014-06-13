# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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