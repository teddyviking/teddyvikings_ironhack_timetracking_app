# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.all.destroy_all
projects = Project.create([{ id: 1, name: 'Iron F', description: 'Cool project'},
							{id: 2, name: 'lovely day', description: "Not any more"},
							{id: 3, name: 'Final Ironhack project', description: 'You are gonna die, baby'}])