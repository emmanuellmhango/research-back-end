class AddInterviewConductedToSaveEmailInvitation < ActiveRecord::Migration[7.0]
  def change
    add_column :save_email_invitations, :interview_conducted, :string
  end
end
