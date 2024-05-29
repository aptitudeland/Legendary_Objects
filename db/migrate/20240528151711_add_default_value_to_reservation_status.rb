class AddDefaultValueToReservationStatus < ActiveRecord::Migration[7.1]
  def change
    change_column :reservations, :status, :string, :default => "pending"
  end
end
