class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def add_price(amount, price)
    (price * amount * 1.10).round.to_s(:delimited, delimiter: ',')
  end
end
