require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品の保存' do
    context '保存できるとき' do
      it '全ての項目がが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '保存できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end

      it 'item_category_idが空では登録できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it 'item_sales_status_idが空では登録できない' do
        @item.item_sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end

      it 'item_shipping_fee_status_idが空では登録できない' do
        @item.item_shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end

      it 'item_prefecture_idが空では登録できない' do
        @item.item_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end

      it 'item_scheduled_delivery_idが空では登録できない' do
        @item.item_scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end

      it 'item_category_idが「---」では登録できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it 'item_sales_status_idが「---」では登録できない' do
        @item.item_sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end

      it 'item_shipping_fee_status_idが「---」では登録できない' do
        @item.item_shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end

      it 'item_prefecture_idが「---」では登録できない' do
        @item.item_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end

      it 'item_scheduled_delivery_idが「---」では登録できない' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end

      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it 'item_priceが価格に半角数字以外が含まれている場合は出品できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @item.item_price = '９０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end

      it 'item_priceが300未満では登録できない' do
        @item.item_price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end

      it 'item_priceが9_999_999円を超えると出品できない' do
        @item.item_price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end

      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

    end
  end
end


