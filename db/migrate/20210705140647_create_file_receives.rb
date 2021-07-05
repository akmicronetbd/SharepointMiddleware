class CreateFileReceives < ActiveRecord::Migration[6.1]
  def change
    create_table :file_receives do |t|
      t.string :file_name
      t.string :folder_name
      t.string  :account_id
      t.boolean :completed
      t.timestamps
    end
  end
end
