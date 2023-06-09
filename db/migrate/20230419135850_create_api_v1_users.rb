class CreateApiV1Users < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :phone

      t.timestamps
    end
  end
end
