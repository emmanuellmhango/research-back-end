class Api::V1::JobapplicationsController < ApplicationController
  before_action :set_api_v1_jobapplication, only: %i[ show update destroy ]

  # GET /api/v1/jobapplications
  def index
    @api_v1_jobapplications = Jobapplication.all

    render json: @api_v1_jobapplications
  end

  # GET /api/v1/jobapplications/1
  def show
    render json: @api_v1_jobapplication
  end

  # POST /api/v1/jobapplications
  def create
    @api_v1_jobapplication = Jobapplication.new(api_v1_jobapplication_params)

    if @api_v1_jobapplication.save
      render json: @api_v1_jobapplication, status: :created, location: @api_v1_jobapplication
    else
      render json: @api_v1_jobapplication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/jobapplications/1
  def update
    if @api_v1_jobapplication.update(api_v1_jobapplication_params)
      render json: @api_v1_jobapplication
    else
      render json: @api_v1_jobapplication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/jobapplications/1
  def destroy
    @api_v1_jobapplication.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_jobapplication
      @api_v1_jobapplication = Jobapplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_jobapplication_params
      params.require(:api_v1_jobapplication).permit(:user_id, :job_id)
    end
end
