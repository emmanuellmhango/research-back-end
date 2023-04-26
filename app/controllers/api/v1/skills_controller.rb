class Api::V1::SkillsController < ApplicationController
  before_action :set_api_v1_skill, only: %i[ show update destroy ]

  # GET /api/v1/skills
  def index
    @api_v1_skills = Skill.all

    render json: @api_v1_skills
  end

  # GET /api/v1/skills/1
  def show
    render json: @api_v1_skill
  end

  # POST /api/v1/skills
  def create
    @api_v1_skill = Skill.new(api_v1_skill_params)

    if @api_v1_skill.save
      render json: @api_v1_skill, status: :created
    else
      render json: @api_v1_skill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/skills/1
  def update
    if @api_v1_skill.update(api_v1_skill_params)
      render json: @api_v1_skill
    else
      render json: @api_v1_skill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/skills/1
  def destroy
    @api_v1_skill.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_skill
      @api_v1_skill = Skill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_skill_params
      params.require(:skill).permit(:skill_name, :user_id)
    end
end
