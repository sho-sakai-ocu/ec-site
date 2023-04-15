class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: {
    production_not_possible: 0,
    production_pending: 1,
    in_production: 2,
    production_complete: 3
  }

  def price_including_tax
    (self.price * 1.10).round.to_s(:delimited, delimiter: ',')
  end

  def subtotal
    (self.item.price * self.amount * 1.10).round.to_s(:delimited, delimiter: ',')
  end
end
