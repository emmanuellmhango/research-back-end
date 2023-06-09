class AddUserToSaveEmailInvitation < ActiveRecord::Migration[7.0]
  def change
    add_reference :save_email_invitations, :user, null: false, foreign_key: true
  end
end
