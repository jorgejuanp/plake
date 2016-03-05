class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all.order('created_at DESC')

    @projects
  end

  def show
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: "El proyecto se ha creado correctamente"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path, notice: "Project deleted"
  end

  def projects_as_json
    projects = Project.all

    render json: projects
  end

  private
  def project_params
    params.require(:project).permit(:thumbnail, :title, :description, :tag_list, :instructions)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
