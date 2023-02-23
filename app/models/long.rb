class Long < ActiveHash::Base
  self.data = [
    { id: 1, long: '---' },
    { id: 2, long: '1~2日で発送' },
    { id: 3, long: '2~3日で発送' },
    { id: 4, long: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end