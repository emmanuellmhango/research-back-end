require "test_helper"

class Api::V1::JobapplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_jobapplication = api_v1_jobapplications(:one)
  end

  test "should get index" do
    get api_v1_jobapplications_url, as: :json
    assert_response :success
  end

  test "should create api_v1_jobapplication" do
    assert_difference("Api::V1::Jobapplication.count") do
      post api_v1_jobapplications_url, params: { api_v1_jobapplication: { job_id: @api_v1_jobapplication.job_id, user_id: @api_v1_jobapplication.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_jobapplication" do
    get api_v1_jobapplication_url(@api_v1_jobapplication), as: :json
    assert_response :success
  end

  test "should update api_v1_jobapplication" do
    patch api_v1_jobapplication_url(@api_v1_jobapplication), params: { api_v1_jobapplication: { job_id: @api_v1_jobapplication.job_id, user_id: @api_v1_jobapplication.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_jobapplication" do
    assert_difference("Api::V1::Jobapplication.count", -1) do
      delete api_v1_jobapplication_url(@api_v1_jobapplication), as: :json
    end

    assert_response :no_content
  end
end
