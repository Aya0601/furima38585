require 'rails_helper'

RSpec.describe SendAddress, type: :model do
  before do
    @send_address = FactoryBot.build(:send_address)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@send_address).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @send_address.buyer_id = 1
        expect(@send_address).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @send_address.buyer_id = 1
        expect(@send_address).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @send_address.post_code = '123-4560'
        expect(@send_address).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @send_address.area_id = 1
        expect(@send_address).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @send_address.city = '横浜市'
        expect(@send_address).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @send_address.address_number = '旭区１２３'
        expect(@send_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @send_address.house_name = nil
        expect(@send_address).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @send_address.telephone = 12_345_678_910
        expect(@send_address).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @send_address.user_id = nil
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @send_address.item_id = nil
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @send_address.post_code = nil
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include("Postcode can't be blank", 'Postcode is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @send_address.post_code = 1_234_567
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @send_address.area_id = 0
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include("Area can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @send_address.area_id = nil
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @send_address.city = nil
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @send_address.address_number = nil
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include("Addressnumber can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @send_address.telephone = nil
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @send_address.telephone = '123 - 1234 - 1234'
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @send_address.telephone = 12_345_678_910_123_111
        @send_address.valid?
        expect(@send_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @send_address.token = nil
        @send_address.valid?
        expect(@send_address.full_messages).to include("Token can't be blank")
      end
    end
  end
end
