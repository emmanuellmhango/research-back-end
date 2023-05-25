require "test_helper"

class Api::V1::SaveExpressionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_save_expression = api_v1_save_expressions(:one)
  end

  test "should get index" do
    get api_v1_save_expressions_url, as: :json
    assert_response :success
  end

  test "should create api_v1_save_expression" do
    assert_difference("Api::V1::SaveExpression.count") do
      post api_v1_save_expressions_url, params: { api_v1_save_expression: { expressions: @api_v1_save_expression.expressions, job_id: @api_v1_save_expression.job_id, user_id: @api_v1_save_expression.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_save_expression" do
    get api_v1_save_expression_url(@api_v1_save_expression), as: :json
    assert_response :success
  end

  test "should update api_v1_save_expression" do
    patch api_v1_save_expression_url(@api_v1_save_expression), params: { api_v1_save_expression: { expressions: @api_v1_save_expression.expressions, job_id: @api_v1_save_expression.job_id, user_id: @api_v1_save_expression.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_save_expression" do
    assert_difference("Api::V1::SaveExpression.count", -1) do
      delete api_v1_save_expression_url(@api_v1_save_expression), as: :json
    end

    assert_response :no_content
  end
end
