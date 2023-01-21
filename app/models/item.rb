class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

   has_one_attached :image

   def get_item_image(width,height)
    unless image.attached?
     file_path=Rails.root.join('app/assets/images/default-image.jpg')
     image.attach(io:File.open(file_path),filename: 'default-image.jpg',content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
   end



   validates :name,presence:true
   validates :introduction,presence:true
   validates :price,presence:true



  def add_tax_price
    (price * 1.1).round
  end
end
