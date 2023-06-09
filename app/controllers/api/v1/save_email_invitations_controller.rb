class Api::V1::SaveEmailInvitationsController < ApplicationController
  before_action :set_api_v1_save_email_invitation, only: %i[ show update destroy ]

  # GET /api/v1/save_email_invitations
  def index
    begin
      @api_v1_save_email_invitations = SaveEmailInvitation.where(job_id: params[:job_id])
      if @api_v1_save_email_invitations.present?
        render json: { success: true, invitations: @api_v1_save_email_invitations }
      else
        render json: { success: false }
      end
    rescue StandardError => e
      render json: { code: 201, message: e.message }, status: :unprocessable_entity
    end
  end  

  # GET /api/v1/save_email_invitations/1
  def show
    render json: @api_v1_save_email_invitation
  end

  # POST /api/v1/save_email_invitations
  def create
    @api_v1_save_email_invitation = SaveEmailInvitation.new(api_v1_save_email_invitation_params)

    if @api_v1_save_email_invitation.save
      render json: @api_v1_save_email_invitation, status: :created
    else
      render json: @api_v1_save_email_invitation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/save_email_invitations/1
  def update
    if @api_v1_save_email_invitation.update(api_v1_save_email_invitation_params)
      render json: @api_v1_save_email_invitation
    else
      render json: @api_v1_save_email_invitation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/save_email_invitations/1
  def destroy
    @api_v1_save_email_invitation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_save_email_invitation
      @api_v1_save_email_invitation = SaveEmailInvitation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_save_email_invitation_params
      params.require(:save_email_invitation).permit(:name, :email, :position, :interview_conducted, :job_id, :user_id)
    end
end
