class CreateUserInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_informations do |t|
      t.string :account_id
      t.text :access_token
      t.string :token_type
      t.text :refresh_token
      t.datetime :expires_at
      t.string :user_email
      t.string :account_base_uri
      t.string :organization_id
      t.string :name
      t.string :sub
      t.timestamps
    end
  end
end
