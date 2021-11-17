require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @items = FactoryBot.build(:item)
  end

  describe '出品情報登録' do
    context '上手くいかない時' do
      it '商品画像が空だと登録できない' do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @items.name = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと登録できない' do
        @items.description = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空だと登録できない' do
        @items.category_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態が空だと登録できない' do
        @items.condition_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料が空だと登録できない' do
        @items.shipping_cost_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送地域が空だと登録できない' do
        @items.shipping_place_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Shipping place can't be blank")
      end
      it '発送日数が空だと登録できない' do
        @items.shipping_day_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '販売価格が空だと登録できない' do
        @items.price = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は半角数字でないと登録できない' do
        @items.price = 'aaaaaa'
        @items.valid?
        expect(@items.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
      it '販売価格が¥300より少ない時は出品できない' do
        @items.price = '299'
        @items.valid?
        expect(@items.errors.full_messages).to include('Price is out of setting range')
      end
      it '販売価格が¥9999999より大きい時は出品できない' do
        @items.price = '10000000'
        @items.valid?
        expect(@items.errors.full_messages).to include('Price is out of setting range')
      end
      it 'userが紐付いていなければ登録できない' do
        @items.user = nil
        @items.valid?
        expect(@items.errors.full_messages).to include('User must exist')
      end
    end

    context '上手くいく時' do
      it '必要な情報を全て適切に入力すれば登録できる' do
        expect(@items).to be_valid
      end
    end
  end
end
