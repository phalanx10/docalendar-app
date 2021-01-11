class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '定例会' },
    { id: 3, name: '貸切' },
    { id: 4, name: 'トレーニング' },
    { id: 5, name: '買い物' },
    { id: 6, name: 'カスタム品受取日' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tasks
end
