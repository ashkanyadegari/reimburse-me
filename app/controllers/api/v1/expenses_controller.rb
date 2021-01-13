class Api::V1::ExpensesController < Api::V1::BaseController
  before_action :set_expense, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @expenses = Expense.where(user_id: params["user_id"])
    render json: @expenses #Just for testing
  end

  def show
    render json: @expense
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:open_id, :name, :company_id, :avatar, :user_points)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end
end
