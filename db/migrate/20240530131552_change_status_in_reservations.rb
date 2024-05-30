class ChangeStatusInReservations < ActiveRecord::Migration[7.1]
  def change
    change_column_default :reservations, :status, from: nil, to: 0
    change_column_null :reservations, :status, false
  end
end
