class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :origin_region_id, :city, :street_address, :building_name, :telephone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :origin_region_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :street_address
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/, message: "Only half-width numeric values with 10 to 11 digits are allowed."}
  end

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end