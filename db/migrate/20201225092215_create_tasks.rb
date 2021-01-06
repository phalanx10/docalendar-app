class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string         :title
      t.text           :description
      t.datetime       :start_time
      t.integer        :category_id
      t.integer        :priority_id
      t.references     :user, foreign_key: true
      t.timestamps
    end
  end
end