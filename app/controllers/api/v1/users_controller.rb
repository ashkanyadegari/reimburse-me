class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:assign_to_company]

  def index
    @users = User.all
    render json: { users: @users }
  end

  def show
    render json: { user: @user }
  end

  def create
  end

  def update
  end

  def destroy
  end

  def assign_to_company
    @company = Company.find_by_invitation_code(params["invitation_code"])
    @user = User.find(params["user_id"])
    @user.company = @company
    @user.save
    render json: { status: @user }
  end

  private

  def user_params
    params.require(:user).permit(:title, :description)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
