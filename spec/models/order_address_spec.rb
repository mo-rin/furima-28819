require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入履歴の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '履歴の保存がうまく行くとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '履歴の保存がうまくいかないとき' do
      it 'クレジットカード情報(token)が空だと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end
      it 'postal_codeにハイフンを含んだ３桁と４桁でないと保存できないこと' do
        @order_address.postal_code = '123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idがid: 0だと保存できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numが10から11桁の数字でないと保存できないこと' do
        @order_address.phone_num = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone num is invalid')
      end
      it 'phone_numに「ハイフン」が入っていると保存できないこと' do
        @order_address.phone_num = '1234-67-90'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone num is invalid')
      end
    end
  end
end
