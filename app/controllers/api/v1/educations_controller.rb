class Api::V1::EducationsController < ApplicationController
  before_action :set_api_v1_education, only: %i[ show update destroy ]

  # GET /api/v1/educations
  def index
    @api_v1_educations = Education.all

    render json: @api_v1_educations
  end

  # GET /api/v1/educations/1
  def show
    render json: @api_v1_education
  end

  # POST /api/v1/educations
  def create
    @api_v1_education = Education.new(api_v1_education_params)

    if @api_v1_education.save
      render json: @api_v1_education, status: :created
    else
      render json: @api_v1_education.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/educations/1
  def update
    if @api_v1_education.update(api_v1_education_params)
      render json: @api_v1_education
    else
      render json: @api_v1_education.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/educations/1
  def destroy
    @api_v1_education.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_education
      @api_v1_education = Education.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_education_params
      params.require(:education).permit(:qualification, :university, :date_completed, :location, :user_id)
    end
end
