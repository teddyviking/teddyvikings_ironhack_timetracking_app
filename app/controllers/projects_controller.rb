class ProjectsController < ApplicationController
	def index
		@projects = Project.last_created_projects(10)
	end

	def show
		# begin
		# 	@project = Project.find params[:id]
		# rescue ActiveRecord::RecordNotFound
		# 	render 'project_not_found'
		# 	Rails.logger.info"================"
		# 	Rails.logger.info"Project not found"
		# 	Rails.logger.info"================"
		# end
		render('project_not_found') unless (@project = Project.find_by(id: params[:id]))
	end
end
