class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    (self.item.price * self.amount * 1.10).round.to_s(:delimited, delimiter: ',')
  end
end
