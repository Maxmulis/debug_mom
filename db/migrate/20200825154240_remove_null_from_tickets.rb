class RemoveNullFromTickets < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tickets, :mom_id, true
    change_column_null :tickets, :helper_id, true
  end
end
