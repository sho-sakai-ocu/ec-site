class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  attr_accessor :address_id

  enum payment_method: { 
    credit_card: 0, 
    transfer: 1 
  }

  enum status: {
    payment_waiting: 0,
    payment_confirmation: 1,
    in_production: 2,
    preparing_delivery: 3,
    delivered: 4
  }

  def full_address
    "〒" + self.postal_code + " " + self.address + "  " + self.name
  end

  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end
end
