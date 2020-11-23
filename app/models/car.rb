class Car < ApplicationRecord
    belongs_to :user, :counter_cache => true
    has_many :slots, dependent: :destroy
end
