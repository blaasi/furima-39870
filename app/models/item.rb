class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :Status
  belongs_to :ShippingCostPayer
  belongs_to :OriginRegion
  belongs_to :DaysUntilShipping


  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true

  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
  validates :category_id
  validates :status_id
  validates :shipping_cost_payer_id
  validates :origin_region_id
  validates :days_until_shipping_id
  end
  
  validates :sale_price, presence: true

end
