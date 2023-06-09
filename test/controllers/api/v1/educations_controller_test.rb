require "test_helper"

class Api::V1::EducationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_education = api_v1_educations(:one)
  end

  test "should get index" do
    get api_v1_educations_url, as: :json
    assert_response :success
  end

  test "should create api_v1_education" do
    assert_difference("Api::V1::Education.count") do
      post api_v1_educations_url, params: { api_v1_education: { date_completed: @api_v1_education.date_completed, location: @api_v1_education.location, qualification: @api_v1_education.qualification, university: @api_v1_education.university, user_id: @api_v1_education.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_education" do
    get api_v1_education_url(@api_v1_education), as: :json
    assert_response :success
  end

  test "should update api_v1_education" do
    patch api_v1_education_url(@api_v1_education), params: { api_v1_education: { date_completed: @api_v1_education.date_completed, location: @api_v1_education.location, qualification: @api_v1_education.qualification, university: @api_v1_education.university, user_id: @api_v1_education.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_education" do
    assert_difference("Api::V1::Education.count", -1) do
      delete api_v1_education_url(@api_v1_education), as: :json
    end

    assert_response :no_content
  end
end
