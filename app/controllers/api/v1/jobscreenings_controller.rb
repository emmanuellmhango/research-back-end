class Api::V1::JobscreeningsController < ApplicationController
  before_action :set_api_v1_jobscreening, only: %i[ show update destroy ]

  # GET /api/v1/jobscreenings
  def index
    @api_v1_jobscreenings = Jobscreening.all

    render json: @api_v1_jobscreenings
  end

  # GET /api/v1/jobscreenings/1
  def show
    render json: @api_v1_jobscreening
  end

  # GET /api/v1/jobscreenings/show_applicants_per_job
  def show_applicants_per_job
    @api_v1_jobscreenings = Jobscreening.where(job_id: params[:id])

    render json: @api_v1_jobscreenings
  end
  
  # POST /api/v1/jobscreenings
  def create
    @api_v1_jobscreening = Jobscreening.new(api_v1_jobscreening_params)

    if @api_v1_jobscreening.save
      render json: @api_v1_jobscreening, status: :created
    else
      render json: @api_v1_jobscreening.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/jobscreenings/1
  def update
    if @api_v1_jobscreening.update(api_v1_jobscreening_params)
      render json: @api_v1_jobscreening
    else
      render json: @api_v1_jobscreening.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/jobscreenings/1
  def destroy
    @api_v1_jobscreening.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_jobscreening
      @api_v1_jobscreening = Jobscreening.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_jobscreening_params
      params.require(:jobscreening).permit(:result, :user_id, :job_id)
    end
end
