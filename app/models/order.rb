class Order < ApplicationRecord
belongs_to :customer
has_many :order_items, dependent: :destroy

enum payment:{ credit_card:0,transfer:1 }

def add_tax_price
    (price * 1.1).round
end


end
