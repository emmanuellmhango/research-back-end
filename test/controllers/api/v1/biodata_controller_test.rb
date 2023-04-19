require "test_helper"

class Api::V1::BiodataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_biodatum = api_v1_biodata(:one)
  end

  test "should get index" do
    get api_v1_biodata_url, as: :json
    assert_response :success
  end

  test "should create api_v1_biodatum" do
    assert_difference("Api::V1::Biodatum.count") do
      post api_v1_biodata_url, params: { api_v1_biodatum: { address: @api_v1_biodatum.address, date_of_birth: @api_v1_biodatum.date_of_birth, education: @api_v1_biodatum.education, experience: @api_v1_biodatum.experience, user_id: @api_v1_biodatum.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_biodatum" do
    get api_v1_biodatum_url(@api_v1_biodatum), as: :json
    assert_response :success
  end

  test "should update api_v1_biodatum" do
    patch api_v1_biodatum_url(@api_v1_biodatum), params: { api_v1_biodatum: { address: @api_v1_biodatum.address, date_of_birth: @api_v1_biodatum.date_of_birth, education: @api_v1_biodatum.education, experience: @api_v1_biodatum.experience, user_id: @api_v1_biodatum.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_biodatum" do
    assert_difference("Api::V1::Biodatum.count", -1) do
      delete api_v1_biodatum_url(@api_v1_biodatum), as: :json
    end

    assert_response :no_content
  end
end
