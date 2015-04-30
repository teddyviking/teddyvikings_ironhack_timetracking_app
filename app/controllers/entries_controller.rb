class EntriesController < ApplicationController
  def index
  	@project = Project.find(params[:project_id])
  	# @entries = @project.entries.order(created_at: :desc)
  	@entries = Entry.where(project_id: params[:project_id]).order(created_at: :desc)

	end
  def show
  end

  def new
  	@project = Project.find params[:project_id]
  	@entry = @project.entries.new	
  end

  def create
  	@project = Project.find params[:project_id]
  	@entry = @project.entries.new entry_params
  	if @entry.save
      flash.now[:notice] = "Entry created successfully"
  		redirect_to project_entries_path(@project)
  	else
      flash.now[:alert] = "Entry not created"
      render 'new'
  	end	
  end


  def edit
    @project = Project.find params[:project_id]
    @entry = @project.entries.find params[:id]
  end

  def update
    @project = Project.find params[:project_id]
    @entry = @project.entries.find params[:id]
    if @entry.update_attributes entry_params
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find params[:project_id]
    @entry = @project.entries.find params[:id]
    @entry.destroy

    redirect_to project_entries_path(@project)
  end

  private

  def entry_params
  	params.require(:entry).permit(:hours, :minutes, :date)
  end
end
