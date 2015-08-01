class PeopleController < ApplicationController
  def index
  	@people = Person.all
  end

  def show
  	@person = Person.find(params[:id])
  	@available_projects = Project.all - @person.projects
  end

  def new
  	@person = Person.new
  end

  def create
  	@person = Person.new person_params
  	if @person.save
  		flash.now[:notice] = "Person successfully created"
  		redirect_to person_path(@person)
  	else
  		flash.now[:alert] = "Person couldn't be saved"
  		render "new"
  	end
  end


  def edit
  	
  end

  def update
  end

  def associate_project
  	binding.pry
  	@person = Person.find params[:id]
  	@project = Project.find params[:project_id]
  	@person.projects << @project
  	redirect_to person_path(@person)
  end

  private

  def person_params
  	params.require(:person).permit(:name, :email)
  end
end
