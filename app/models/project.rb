class Project < ActiveRecord::Base
	
	def self.iron_find(id)
		self.where("id =?", id).first
	end

	def self.clean_old
		projects = self.where("created_at < ?", 1.week.ago)
		projects.destroy_all
	end

	def self.last_created_projects(n)
		self.order(created_at: :desc).limit(n)
	end

end
