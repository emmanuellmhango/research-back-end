require "test_helper"

class Api::V1::SaveEmailInvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_save_email_invitation = api_v1_save_email_invitations(:one)
  end

  test "should get index" do
    get api_v1_save_email_invitations_url, as: :json
    assert_response :success
  end

  test "should create api_v1_save_email_invitation" do
    assert_difference("Api::V1::SaveEmailInvitation.count") do
      post api_v1_save_email_invitations_url, params: { api_v1_save_email_invitation: { email: @api_v1_save_email_invitation.email, job_id: @api_v1_save_email_invitation.job_id, name: @api_v1_save_email_invitation.name, position: @api_v1_save_email_invitation.position } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_save_email_invitation" do
    get api_v1_save_email_invitation_url(@api_v1_save_email_invitation), as: :json
    assert_response :success
  end

  test "should update api_v1_save_email_invitation" do
    patch api_v1_save_email_invitation_url(@api_v1_save_email_invitation), params: { api_v1_save_email_invitation: { email: @api_v1_save_email_invitation.email, job_id: @api_v1_save_email_invitation.job_id, name: @api_v1_save_email_invitation.name, position: @api_v1_save_email_invitation.position } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_save_email_invitation" do
    assert_difference("Api::V1::SaveEmailInvitation.count", -1) do
      delete api_v1_save_email_invitation_url(@api_v1_save_email_invitation), as: :json
    end

    assert_response :no_content
  end
end
