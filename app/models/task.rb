class Task < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :priority

  with_options presence: true do
    validates :title
    validates :description
    validates :start_time
    validates :end_time
    validates :category_id, numericality: { other_than: 1 }
    validates :priority_id, numericality: { other_than: 1 }
    validates :user_id
  end

  def self.search(search)
    if search != ''
      Task.where('title LIKE(?)', "%#{search}%")
    else
      Task.all
    end
  end
end
