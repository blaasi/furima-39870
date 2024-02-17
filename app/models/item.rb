class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :Status
  belongs_to :ShippingCostPayer
  belongs_to :OriginRegion
  belongs_to :DaysUntilShipping

with_options presence: true do
  validates :image
  validates :name
  validates :explanation
  validates :sale_price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }
end

  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
  validates :category_id
  validates :status_id
  validates :shipping_cost_payer_id
  validates :origin_region_id
  validates :days_until_shipping_id
  end
  

end
