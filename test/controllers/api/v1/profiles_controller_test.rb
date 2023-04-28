require "test_helper"

class Api::V1::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_profile = api_v1_profiles(:one)
  end

  test "should get index" do
    get api_v1_profiles_url, as: :json
    assert_response :success
  end

  test "should create api_v1_profile" do
    assert_difference("Api::V1::Profile.count") do
      post api_v1_profiles_url, params: { api_v1_profile: { profile_position: @api_v1_profile.profile_position, profile_text: @api_v1_profile.profile_text, user_id: @api_v1_profile.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_profile" do
    get api_v1_profile_url(@api_v1_profile), as: :json
    assert_response :success
  end

  test "should update api_v1_profile" do
    patch api_v1_profile_url(@api_v1_profile), params: { api_v1_profile: { profile_position: @api_v1_profile.profile_position, profile_text: @api_v1_profile.profile_text, user_id: @api_v1_profile.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_profile" do
    assert_difference("Api::V1::Profile.count", -1) do
      delete api_v1_profile_url(@api_v1_profile), as: :json
    end

    assert_response :no_content
  end
end
