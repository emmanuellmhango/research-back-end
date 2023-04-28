class Api::V1::CompaniesController < ApplicationController
  before_action :set_api_v1_company, only: %i[ show update destroy ]

  # GET /api/v1/companies
  def index
    begin
      @api_v1_companies = Company.find_by(email: params[:email], password: params[:password])
      if @api_v1_companies.present?
        render json: { success: true, company: @api_v1_companies }
      else
        render json: { success: false }
      end
    rescue StandardError => e
      render json: { code: 201, message: e.message }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/companies/1
  def show
    render json: @api_v1_company
  end

  # POST /api/v1/companies
  def create
    @api_v1_company = Company.new(api_v1_company_params)

    if @api_v1_company.save
      render json: @api_v1_company, status: :created
    else
      render json: @api_v1_company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/companies/1
  def update
    if @api_v1_company.update(api_v1_company_params)
      render json: @api_v1_company
    else
      render json: @api_v1_company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/companies/1
  def destroy
    @api_v1_company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_company
      @api_v1_company = Api::V1::Company.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_company_params
      params.require(:company).permit(:name, :phone, :email, :website, :password, :address)
    end
end
