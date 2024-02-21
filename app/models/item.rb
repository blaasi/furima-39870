class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost_payer
  belongs_to :origin_region
  belongs_to :days_until_shipping

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :sale_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_payer_id
    validates :origin_region_id
    validates :days_until_shipping_id
  end

  def sold_out?
    Order.exists?(item_id: id)
  end
end
