class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

   has_one_attached :image

   validates :name,presence:true
   validates :introduction,presence:true
   validates :price,presence:true


  def add_tax_price
    (price * 1.1).round
  end
end
