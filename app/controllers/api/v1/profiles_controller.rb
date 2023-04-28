class Api::V1::ProfilesController < ApplicationController
  before_action :set_api_v1_profile, only: %i[ show update destroy ]

  # GET /api/v1/profiles
  def index
    @api_v1_profiles = Profile.all

    render json: @api_v1_profiles
  end

  # GET /api/v1/profiles/1
  def show
    render json: @api_v1_profile
  end

  # POST /api/v1/profiles
  def create
    @api_v1_profile = Profile.new(api_v1_profile_params)

    if @api_v1_profile.save
      render json: @api_v1_profile, status: :created
    else
      render json: @api_v1_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/profiles/1
  def update
    if @api_v1_profile.update(api_v1_profile_params)
      render json: @api_v1_profile
    else
      render json: @api_v1_profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/profiles/1
  def destroy
    @api_v1_profile.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_profile
      @api_v1_profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_profile_params
      params.require(:profile).permit(:profile_position, :profile_text, :user_id)
    end
end
