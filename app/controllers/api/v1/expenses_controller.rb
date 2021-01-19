class Api::V1::ExpensesController < Api::V1::BaseController
  before_action :set_expense, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy, :fapiao_upload]

  def index
    @expenses = Expense.where(user_id: params["user_id"]).reverse
  end

  def show
  end

  def create
    p params
    @expense = Expense.new(category_id: params["category_id"], user_id: params["user_id"], amount: params["amount"], description: params["description"], reimbursement: params["reimbursement"], expense_date: params["expense_date"])
    @expense.save

    render json: {expense: @expense}
  end

  def fapiao_upload
    @expense = Expense.find(params["id"])
    @expense.photo.attach(params["fapiao"])
    @expense.save
    render json: {status: @expense.photo.service_url}
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
