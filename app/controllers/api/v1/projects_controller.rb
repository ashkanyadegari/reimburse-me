class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :set_project, only: [:show, :update]

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
