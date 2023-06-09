class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :website
      t.string :password
      t.string :address

      t.timestamps
    end
  end
end
