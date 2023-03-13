require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer_address = FactoryBot.build(:buyer_address)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_address).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @buyer_address.user_id = 1
        expect(@buyer_address).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @buyer_address.item_id = 1
        expect(@buyer_address).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @buyer_address.post_code = '123-4560'
        expect(@buyer_address).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @buyer_address.area_id = 1
        expect(@buyer_address).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @buyer_address.city = '横浜市'
        expect(@buyer_address).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @buyer_address.address_number = '１２３'
        expect(@buyer_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @buyer_address.house_name = nil
        expect(@buyer_address).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @buyer_address.telephone = 12_345_678_910
        expect(@buyer_address).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @buyer_address.post_code = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @buyer_address.post_code = 1_234_567
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Post code is invalid')
      end
      it '都道府県が「---」だと保存できないこと' do
        @buyer_address.area_id = 0
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Area must be other than 0")
      end
      it '都道府県が空だと保存できないこと' do
        @buyer_address.area_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @buyer_address.city = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @buyer_address.address_number = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @buyer_address.telephone = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @buyer_address.telephone = '123 - 1234 - 1234'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @buyer_address.telephone = 12_345_678_910_123_111
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号が9桁以下では購入できない' do
        @buyer_address.telephone = 12
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号に全角数字が含まれている場合は購入できない' do
        @buyer_address.telephone = '１２'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
