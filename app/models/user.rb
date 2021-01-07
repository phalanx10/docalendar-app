class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Set including both letters and numbers.' }

  has_many :tasks
  has_one_attached :image

  def self.guest
    find_or_create_by(email: 'test1@test.com') do |user|
      user.nickname = ENV['TEST_ACCOUNT_NICKNAME']
      user.password = ENV['TEST_ACCOUNT_PASSWORD']
    end
  end
end
