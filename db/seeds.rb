# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.all.destroy_all
projects = Project.create([{name: 'Iron F', description: 'Cool project'},
							{name: 'lovely day', description: "Not any more"},
							{name: 'Final Ironhack project', description: 'You are gonna die, baby'}])