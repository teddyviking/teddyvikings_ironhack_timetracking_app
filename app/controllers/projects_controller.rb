class ProjectsController < ApplicationController
	def index
		@projects = Project.last_created_projects(10)
		render('no_projects', layout: 'not_found') if @projects.empty?
	end

	def show
		render('project_not_found') unless (@project = Project.find_by(id: params[:id]))
		@total_hours = @project.total_hours_in_month(2, 2015)
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new project_params
		if @project.save
			redirect_to project_path(@project)
		else
			render 'new'
		end
	end

	private
	def project_params
		params.require(:project).permit(:name, :description)
	end
end
