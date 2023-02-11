require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000"
        first_name:"あべ", last_name:"あべ",first_name_kana: "カナ", last_name_kana:"カナ", birth:"2000-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000",
        first_name:"あべ", last_name:"あべ",first_name_kana: "カナ", last_name_kana:"カナ", birth:"2000-01-01")
      user.valid?
      binding.pry
      #expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
