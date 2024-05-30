class Reservation < ApplicationRecord
  belongs_to :legend
  belongs_to :user
  enum status: { pending: 0, confirmed: 1, canceled: 2, declined: 3 }
end
