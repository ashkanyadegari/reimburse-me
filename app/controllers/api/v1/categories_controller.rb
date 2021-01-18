class Api::V1::CategoriesController < Api::V1::BaseController
  before_action :set_category, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @categories = Category.all
    render json: @categories #Just for testing
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

  def category_params
    params.require(:category).permit(:open_id, :name, :company_id, :avatar, :user_points)
  end

  def render_error
    render json: { errors: @category.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
