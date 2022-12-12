class OrderItem < ApplicationRecord
  belongs_to :ord
  belongs_to :item
end
