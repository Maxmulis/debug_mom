class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.string :name
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
