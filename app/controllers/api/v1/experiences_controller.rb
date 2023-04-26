class Api::V1::ExperiencesController < ApplicationController
  before_action :set_api_v1_experience, only: %i[ show update destroy ]

  # GET /api/v1/experiences
  def index
    @api_v1_experiences = Experience.all

    render json: @api_v1_experiences
  end

  # GET /api/v1/experiences/1
  def show
    render json: @api_v1_experience
  end

  # POST /api/v1/experiences
  def create
    @api_v1_experience = Experience.new(api_v1_experience_params)

    if @api_v1_experience.save
      render json: @api_v1_experience, status: :created
    else
      render json: @api_v1_experience.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/experiences/1
  def update
    if @api_v1_experience.update(api_v1_experience_params)
      render json: @api_v1_experience
    else
      render json: @api_v1_experience.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/experiences/1
  def destroy
    @api_v1_experience.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_experience
      @api_v1_experience = Experience.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_experience_params
      params.require(:experience).permit(:position, :company, :date_joined, :date_left, :location, :user_id)
    end
end
