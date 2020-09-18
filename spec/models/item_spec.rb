require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規商品出品登録' do
    context '新規登録がうまくいくとき' do
      it "item_nameとtext、 categoryとstatus、 delivery_feeとoption、shipping_dayとpriceがあれば登録できる" do

      end
      it "priceが¥300~¥9,999,999の間であれば登録できる" do
      end
      it "priceが半角数字であれば登録できる" do
      end
    end

    context '新規商品出品登録がうまくいかないとき' do
      it "item_nameが空だと登録できない" do
      end
      it "textが空では登録できない" do
      end
      
      it "statusが空では登録できない" do
      end
      it "delivery_feeが空では登録できない" do
      end
      it "optionが空では登録できない" do
      end
      it "shipping_dayが空では登録できない" do
      end
      it "priceが空では登録できない" do
      end
      it "priceが¥300~¥9,999,999の範囲外であれば登録できない" do
      end
      it "priceが全角数字では登録できない" do
      end
    end
  end
end
