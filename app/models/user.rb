class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 #validates :nickname, presence: true, length: { maximum: 6 }
 #validates :password, format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i }
 #validates :last_name,presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ }
 #validates :first_name_kana,presence:true, format: { with: /\A[ァ-ヴー]+\z/u }
 #validates :last_name_kana,presence:true, format: { with:  /\A[ァ-ヴー]+\z/u }
  validates :birth,presence: true

end
