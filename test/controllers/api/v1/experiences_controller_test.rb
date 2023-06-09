require "test_helper"

class Api::V1::ExperiencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_experience = api_v1_experiences(:one)
  end

  test "should get index" do
    get api_v1_experiences_url, as: :json
    assert_response :success
  end

  test "should create api_v1_experience" do
    assert_difference("Api::V1::Experience.count") do
      post api_v1_experiences_url, params: { api_v1_experience: { company: @api_v1_experience.company, date_joined: @api_v1_experience.date_joined, date_left: @api_v1_experience.date_left, location: @api_v1_experience.location, position: @api_v1_experience.position, user_id: @api_v1_experience.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_experience" do
    get api_v1_experience_url(@api_v1_experience), as: :json
    assert_response :success
  end

  test "should update api_v1_experience" do
    patch api_v1_experience_url(@api_v1_experience), params: { api_v1_experience: { company: @api_v1_experience.company, date_joined: @api_v1_experience.date_joined, date_left: @api_v1_experience.date_left, location: @api_v1_experience.location, position: @api_v1_experience.position, user_id: @api_v1_experience.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_experience" do
    assert_difference("Api::V1::Experience.count", -1) do
      delete api_v1_experience_url(@api_v1_experience), as: :json
    end

    assert_response :no_content
  end
end
