class Area_id < ActiveHash::Base
  self.data = [
    { id: 1, area_id: '---' }, { id: 2, area_id: '北海道' }, { id: 3, area_id: '青森県' },
    { id: 4, area_id: '岩手県' }, { id: 5, area_id: '宮城県' }, { id: 6, area_id: '秋田県' },
    { id: 7, area_id: '山形県' }, { id: 8, area_id: '福島県' }, { id: 9, area_id: '茨城県' },
    { id: 10, area_id: '栃木県' }, { id: 11, area_id: '群馬県' }, { id: 12, area_id: '埼玉県' },
    { id: 13, area_id: '千葉県' }, { id: 14, area_id: '東京都' }, { id: 15, area_id: '神奈川県' },
    { id: 16, area_id: '新潟県' }, { id: 17, area_id: '富山県' }, { id: 18, area_id: '石川県' },
    { id: 19, area_id: '福井県' }, { id: 20, area_id: '山梨県' }, { id: 21, area_id: '長野県' },
    { id: 22, area_id: '岐阜県' }, { id: 23, area_id: '静岡県' }, { id: 24, area_id: '愛知県' },
    { id: 25, area_id: '三重県' }, { id: 26, area_id: '滋賀県' }, { id: 27, area_id: '京都府' },
    { id: 28, area_id: '大阪府' }, { id: 29, area_id: '兵庫県' }, { id: 30, area_id: '奈良県' }, 
    { id: 31, area_id: '和歌山県' }, { id: 32, area_id: '鳥取県' }, { id: 33, area_id: '島根県' },
    { id: 34, area_id: '岡山県' }, { id: 35, area_id: '広島県' }, { id: 36, area_id: '山口県' }, 
    { id: 37, area_id: '徳島県' }, { id: 38, area_id: '香川県' }, { id: 39, area_id: '愛媛県' }, 
    { id: 40, area_id: '高知県' }, { id: 41, area_id: '福岡県' }, { id: 42, area_id: '佐賀県' }, 
    { id: 43, area_id: '長崎県' }, { id: 44, area_id: '熊本県' }, { id: 45, area_id: '大分県' }, 
    { id: 46, area_id: '宮崎県' }, { id: 47, area_id: '鹿児島県' }, { id: 48, area_id: '沖縄県' }
  ]

  include ActiveHash: Associations
  has_many :items
end