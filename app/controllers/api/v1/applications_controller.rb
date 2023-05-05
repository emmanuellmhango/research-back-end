class Api::V1::ApplicationsController < ApplicationController
  before_action :set_api_v1_application, only: %i[ show update destroy ]

  # GET /api/v1/applications
  def index
    @api_v1_applications = Api::V1::Application.all

    render json: @api_v1_applications
  end

  # GET /api/v1/applications/1
  def show
    render json: @api_v1_application
  end

  # POST /api/v1/applications
  def create
    @api_v1_application = Api::V1::Application.new(api_v1_application_params)

    if @api_v1_application.save
      render json: @api_v1_application, status: :created, location: @api_v1_application
    else
      render json: @api_v1_application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/applications/1
  def update
    if @api_v1_application.update(api_v1_application_params)
      render json: @api_v1_application
    else
      render json: @api_v1_application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/applications/1
  def destroy
    @api_v1_application.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_application
      @api_v1_application = Api::V1::Application.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_application_params
      params.require(:api_v1_application).permit(:user_id, :job_id)
    end
end
