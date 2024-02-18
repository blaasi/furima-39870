require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it '全ての項目に指定通りの入力があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'sale_priceが空では登録できない' do
        @item.sale_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale price can't be blank")
      end
      it 'sale_priceが300円未満では登録できない' do
        @item.sale_price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale price must be greater than or equal to 300")
      end
      it 'sale_priceが10,000,000円以上では登録できない' do
        @item.sale_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale price must be less than or equal to 9999999")
      end
      it 'sale_priceが全角数字では登録できない' do
        @item.sale_price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale price is not a number")
      end
      it 'sale_priceに小数点が含まれるとでは登録できない' do
        @item.sale_price = 5000.555
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale price must be an integer")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが1では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'shipping_cost_payer_idが1では登録できない' do
        @item.shipping_cost_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost payer can't be blank")
      end
      it 'origin_region_idが1では登録できない' do
        @item.origin_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin region can't be blank")
      end
      it 'days_until_shipping_idが1では登録できない' do
        @item.days_until_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
      end
      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end