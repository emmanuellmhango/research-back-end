class Api::V1::SaveExpressionsController < ApplicationController
  before_action :set_api_v1_save_expression, only: %i[ show update destroy ]

  # GET /api/v1/save_expressions
  def index
    @api_v1_save_expressions = SaveExpression.where(job_id: params[:job_id])
    success = @api_v1_save_expressions.present?
    render json: {success: success, job_results: @api_v1_save_expressions}
  end

  # GET /api/v1/save_expressions for job id
  def get_expressions_for_job
    @api_v1_save_expressions = SaveExpression.where(job_id: params[:job_id])
    success = @api_v1_save_expressions.present?
    render json: {success: success, job_results: @api_v1_save_expressions}
  end

  # GET /api/v1/save_expressions/1
  def show
    render json: @api_v1_save_expression
  end

  # POST /api/v1/save_expressions
  def create
    @api_v1_save_expression = SaveExpression.new(api_v1_save_expression_params)

    if @api_v1_save_expression.save
      render json: @api_v1_save_expression, status: :created
    else
      render json: @api_v1_save_expression.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/save_expressions/1
  def update
    if @api_v1_save_expression.update(api_v1_save_expression_params)
      render json: @api_v1_save_expression
    else
      render json: @api_v1_save_expression.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/save_expressions/1
  def destroy
    @api_v1_save_expression.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_save_expression
      @api_v1_save_expression = SaveExpression.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_save_expression_params
      params.require(:save_expression).permit(:expressions, :user_id, :job_id, :voice_text, :video_feed)
    end
end
