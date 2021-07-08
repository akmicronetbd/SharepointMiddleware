class CreateFileReceives < ActiveRecord::Migration[6.1]
  def change
    create_table :file_receives do |t|
      t.string :document_id
      t.string :account_id
      t.json  :data
      t.boolean :completed
      t.timestamps
    end
  end
end
