class ChangeStatusTypeToIntegerInReservations < ActiveRecord::Migration[7.1]
  def change
    change_column_default :reservations, :status, nil
    change_column :reservations, :status, :integer, using: 'status::integer'
  end
end
