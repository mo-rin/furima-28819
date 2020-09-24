require 'rails_helper'

describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品出品登録' do
    context '新規登録がうまくいくとき' do
      it 'image、item_nameとtext、 categoryとstatus、 delivery_feeとoption、shipping_dayとpriceがあれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが¥300~¥9,999,999の間であれば登録できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = '50000'
        expect(@item).to be_valid
      end
    end

    context '新規商品出品登録がうまくいかないとき' do
      it 'imageが無いと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと登録できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'textが空では登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'statusが空では登録できない' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'delivery_feeが空では登録できない' do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'optionが空では登録できない' do
        @item.option = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Option can't be blank")
      end
      it 'shipping_dayが空では登録できない' do
        @item.shipping_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300~¥9,999,999の範囲外であれば登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが数字以外では登録できない' do
        @item.price = '五百'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number', 'Price is not included in the list')
      end
    end
  end
end
