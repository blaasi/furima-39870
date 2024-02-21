class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :origin_region_id, :city, :street_address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :origin_region_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :street_address
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/, message: "Only half-width numeric values with 10 to 11 digits are allowed."}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postcode: postcode, origin_region_id: origin_region_id, city: city, street_address: street_address, telephone_number: telephone_number, order_id: order.id)
  end
end