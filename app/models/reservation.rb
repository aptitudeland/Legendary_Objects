class Reservation < ApplicationRecord
  belongs_to :legend
  belongs_to :user
end
