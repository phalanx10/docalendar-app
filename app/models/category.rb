class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '仕事' },
    { id: 3, name: 'プライベート' },
    { id: 4, name: '趣味' },
    { id: 5, name: '買い物' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tasks

end
