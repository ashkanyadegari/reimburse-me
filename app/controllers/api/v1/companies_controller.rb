class Api::V1::CompaniesController < Api::V1::BaseController
  before_action :set_company, only: [:show, :update, :destroy]

  def index
    @companies = Company.all
    render json: { companies: @companies }
  end

  def show
    render json: { company: @company }
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def company_params
    params.require(:company).permit(:title, :description)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
