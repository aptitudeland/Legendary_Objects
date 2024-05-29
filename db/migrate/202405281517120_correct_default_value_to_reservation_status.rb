class CorrectDefaultValueToReservationStatus < ActiveRecord::Migration[7.1]
  def change
    change_column :reservations, :status, :string, :default => "Pending"
  end
end
