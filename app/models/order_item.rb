class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def add_tax_price
    (price * 1.1).round
  end

  enum production_status_method: { cannot_manufactured: 0, waiting_production: 1,under_manufacture: 2,completion_production: 3 }

end
