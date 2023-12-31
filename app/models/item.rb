class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details
  has_many :cart_items

  has_one_attached :image

  # validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/strawberry_cake.jpg')
      image.attach(io: File.open(file_path), filename: 'strawberry_cake.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def price_including_tax
    (self.price * 1.10).round.to_s(:delimited, delimiter: ',')
  end
end
