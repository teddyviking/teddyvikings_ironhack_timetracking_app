# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.all.destroy_all
Entry.all.destroy_all
projects = Project.create([{name: 'Iron F', description: 'Cool project'},
							{name: 'lovely day', description: "Not any more"},
							{name: 'Final Ironhack project', description: 'You are gonna die, baby'}])


def create_entries(project, total)
	total.times do |n|
		project.entries.create(hours: rand(5), minutes: rand(60), comments: "Jarl #{n+1}", date: rand(29).weeks.ago)
	end
end
projects.each do |project|
	create_entries(project, 5)
end
