class Api::V1::SaveQuestionsController < ApplicationController
  before_action :set_api_v1_save_question, only: %i[ show update destroy ]

  # GET /api/v1/save_questions
  def index
    @api_v1_save_questions = SaveQuestion.where(job_id: params[:job_id])

    render json: @api_v1_save_questions
  end

  # GET /api/v1/save_questions/1
  def show
    render json: @api_v1_save_question
  end

  # POST /api/v1/save_questions
  def create
    @api_v1_save_question = SaveQuestion.new(api_v1_save_question_params)

    if @api_v1_save_question.save
      render json: @api_v1_save_question, status: :created
    else
      render json: @api_v1_save_question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/save_questions/1
  def update
    if @api_v1_save_question.update(api_v1_save_question_params)
      render json: @api_v1_save_question
    else
      render json: @api_v1_save_question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/save_questions/1
  def destroy
    @api_v1_save_question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_save_question
      @api_v1_save_question = SaveQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_save_question_params
      params.require(:save_question).permit(:question, :answer, :job_id)
    end
end
