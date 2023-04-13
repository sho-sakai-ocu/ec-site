class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  attr_accessor :address_id

  enum payment_method: { credit_card: 0, transfer: 1 }

  def full_address
    "〒" + self.postal_code + " " + self.address + "  " + self.name
  end
end
