class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :nickname, presence: true, length: { maximum: 6 }
           :email,presence: true
           :encrypted_password,presence: true, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
           :encrypted_password_confirmation,presence: true, confirmation: true
           :first_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
           :last_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
           :first_name_kana,presence:true, format: { with: /\A[ァ-ヴー]+\z/u }
           :last_name_kana,presence:true, format: { with:  /\A[ァ-ヴー]+\z/u }
           :birth,presence: true
end
