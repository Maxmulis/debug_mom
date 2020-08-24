class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :description
      t.boolean :solved
      t.references :mom, null: false, foreign_key: { to_table: "users" }
      t.references :helper, null: false, foreign_key: { to_table: "users" }

      t.timestamps
    end
  end
end
