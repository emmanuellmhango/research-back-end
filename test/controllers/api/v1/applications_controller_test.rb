require "test_helper"

class Api::V1::ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_application = api_v1_applications(:one)
  end

  test "should get index" do
    get api_v1_applications_url, as: :json
    assert_response :success
  end

  test "should create api_v1_application" do
    assert_difference("Api::V1::Application.count") do
      post api_v1_applications_url, params: { api_v1_application: { job_id: @api_v1_application.job_id, user_id: @api_v1_application.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_application" do
    get api_v1_application_url(@api_v1_application), as: :json
    assert_response :success
  end

  test "should update api_v1_application" do
    patch api_v1_application_url(@api_v1_application), params: { api_v1_application: { job_id: @api_v1_application.job_id, user_id: @api_v1_application.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_application" do
    assert_difference("Api::V1::Application.count", -1) do
      delete api_v1_application_url(@api_v1_application), as: :json
    end

    assert_response :no_content
  end
end
