class Api::V1::ReportsController < Api::V1::BaseController
  before_action :set_report, only: [:show, :update, :destroy]

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

  def report_params
    params.require(:report).permit(:title, :description)
  end

  def set_report
    @report = Report.find(params[:id])
  end
end
