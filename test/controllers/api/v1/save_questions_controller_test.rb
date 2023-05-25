require "test_helper"

class Api::V1::SaveQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_save_question = api_v1_save_questions(:one)
  end

  test "should get index" do
    get api_v1_save_questions_url, as: :json
    assert_response :success
  end

  test "should create api_v1_save_question" do
    assert_difference("Api::V1::SaveQuestion.count") do
      post api_v1_save_questions_url, params: { api_v1_save_question: { answer: @api_v1_save_question.answer, job_id: @api_v1_save_question.job_id, question: @api_v1_save_question.question } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_save_question" do
    get api_v1_save_question_url(@api_v1_save_question), as: :json
    assert_response :success
  end

  test "should update api_v1_save_question" do
    patch api_v1_save_question_url(@api_v1_save_question), params: { api_v1_save_question: { answer: @api_v1_save_question.answer, job_id: @api_v1_save_question.job_id, question: @api_v1_save_question.question } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_save_question" do
    assert_difference("Api::V1::SaveQuestion.count", -1) do
      delete api_v1_save_question_url(@api_v1_save_question), as: :json
    end

    assert_response :no_content
  end
end
