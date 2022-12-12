class Item < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :order_items, dependent: :destroy
end
