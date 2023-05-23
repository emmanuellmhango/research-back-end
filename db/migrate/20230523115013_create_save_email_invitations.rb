class CreateSaveEmailInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :save_email_invitations do |t|
      t.string :name
      t.string :email
      t.string :position
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
