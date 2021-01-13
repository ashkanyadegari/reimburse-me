class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :set_project, only: [:show, :update]
  skip_before_action :verify_authenticity_token, only: [:index, :create, :update, :destroy]

  def index
    @projects = User.find(params["user_id"]).projects
    render json: @projects
  end

  def show
    render json: @project
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
