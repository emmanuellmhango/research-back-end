require "test_helper"

class Api::V1::JobscreeningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_jobscreening = api_v1_jobscreenings(:one)
  end

  test "should get index" do
    get api_v1_jobscreenings_url, as: :json
    assert_response :success
  end

  test "should create api_v1_jobscreening" do
    assert_difference("Api::V1::Jobscreening.count") do
      post api_v1_jobscreenings_url, params: { api_v1_jobscreening: { job_id: @api_v1_jobscreening.job_id, result: @api_v1_jobscreening.result, user_id: @api_v1_jobscreening.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_jobscreening" do
    get api_v1_jobscreening_url(@api_v1_jobscreening), as: :json
    assert_response :success
  end

  test "should update api_v1_jobscreening" do
    patch api_v1_jobscreening_url(@api_v1_jobscreening), params: { api_v1_jobscreening: { job_id: @api_v1_jobscreening.job_id, result: @api_v1_jobscreening.result, user_id: @api_v1_jobscreening.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_jobscreening" do
    assert_difference("Api::V1::Jobscreening.count", -1) do
      delete api_v1_jobscreening_url(@api_v1_jobscreening), as: :json
    end

    assert_response :no_content
  end
end
