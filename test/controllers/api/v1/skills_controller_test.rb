require "test_helper"

class Api::V1::SkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_skill = api_v1_skills(:one)
  end

  test "should get index" do
    get api_v1_skills_url, as: :json
    assert_response :success
  end

  test "should create api_v1_skill" do
    assert_difference("Api::V1::Skill.count") do
      post api_v1_skills_url, params: { api_v1_skill: { skill_name: @api_v1_skill.skill_name, user_id: @api_v1_skill.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_skill" do
    get api_v1_skill_url(@api_v1_skill), as: :json
    assert_response :success
  end

  test "should update api_v1_skill" do
    patch api_v1_skill_url(@api_v1_skill), params: { api_v1_skill: { skill_name: @api_v1_skill.skill_name, user_id: @api_v1_skill.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_skill" do
    assert_difference("Api::V1::Skill.count", -1) do
      delete api_v1_skill_url(@api_v1_skill), as: :json
    end

    assert_response :no_content
  end
end
