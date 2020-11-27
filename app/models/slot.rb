class Slot < ApplicationRecord
  belongs_to :car
  has_many :requests
end
