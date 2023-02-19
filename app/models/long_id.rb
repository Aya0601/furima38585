class Long_id < ActiveHash::Base
  self.data = [
    { id: 1, long_id: '---' },
    { id: 2, long_id: '1~2日で発送' },
    { id: 3, long_id: '2~3日で発送' },
    { id: 4, long_id: '4~7日で発送' }
  ]

  include ActiveHash: Associations
  has_many :items
end