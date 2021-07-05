class CreateApiTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :api_tokens do |t|
      t.string :code
      t.timestamps
    end
  end
end
