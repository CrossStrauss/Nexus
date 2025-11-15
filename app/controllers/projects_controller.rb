class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :update ]

  def index
    @projects = Project.all.includes(:projectable)
  end

  def show
  end

  def new
    @project_type = params[:type] || "WebDevProject"
    @projectable = @project_type.constantize.new
    @project = Project.new(projectable: @projectable)
  end

  def create
    @project_type = params[:project][:projectable_type]
    @projectable = @project_type.constantize.new(projectable_params)

    if @projectable.save
      @project = Project.new(project_params.merge(projectable: @projectable))

      if @project.save
        redirect_to @project, notice: "Project created successfully!"
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @projectable = @project.projectable
  end

  def update
    @projectable = @project.projectable

    if @project.update(project_params) && @projectable.update(projectable_params)
      redirect_to @project, notice: "Project updated successfully!"
    else
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  # parent model params
  def project_params
    params.require(:project).permit(:title, :description, :thumbnail)
  end

  # dynamic child model params
  def projectable_params
    params.require(params[:project][:projectable_type].underscore.to_sym).permit!
  end
end
