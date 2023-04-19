class Api::V1::BiodataController < ApplicationController
  before_action :set_api_v1_biodatum, only: %i[ show update destroy ]

  # GET /api/v1/biodata
  def index
    @api_v1_biodata = Biodatum.all

    render json: @api_v1_biodata
  end

  # GET /api/v1/biodata/1
  def show
    render json: @api_v1_biodatum
  end

  # POST /api/v1/biodata
  def create
    @api_v1_biodatum = Biodatum.new(api_v1_biodatum_params)

    if @api_v1_biodatum.save
      render json: @api_v1_biodatum, status: :created, location: @api_v1_biodatum
    else
      render json: @api_v1_biodatum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/biodata/1
  def update
    if @api_v1_biodatum.update(api_v1_biodatum_params)
      render json: @api_v1_biodatum
    else
      render json: @api_v1_biodatum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/biodata/1 #
  def destroy
    @api_v1_biodatum.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_biodatum
      @api_v1_biodatum = Biodatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_biodatum_params
      params.require(:api_v1_biodatum).permit(:address, :education, :experience, :date_of_birth, :user_id)
    end
end
