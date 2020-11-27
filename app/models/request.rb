class Request < ApplicationRecord
  belongs_to :slot
  enum status: {available: 0, pending: 1, booked: 2}
end
