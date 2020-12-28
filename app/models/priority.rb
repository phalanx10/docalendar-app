class Priority < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '最優先' },
    { id: 3, name: '優先度　高' },
    { id: 4, name: '優先度　中' },
    { id: 5, name: '優先度　低' },
  ]

  include ActiveHash::Associations
  has_many :tasks

end
