class Project < ActiveRecord::Base
	has_many :entries
	has_many :participations
	has_many :people, through: :participations
	validates :name, uniqueness: true, presence: true, length: {maximum: 30}, format: {with: /\A[^\s][a-zA-Z0-9\s]+\z/}

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

	def total_hours_in_month (month, year)
		date = Time.parse("#{year}-#{month}-01")
		my_range = ( date .. date.end_of_month)
		monthly_entries = entries.where(date: my_range)
		monthly_entries.reduce(0){|sum, entry| sum + (entry.hours.to_f + entry.minutes.to_f/60)}
	end
end
