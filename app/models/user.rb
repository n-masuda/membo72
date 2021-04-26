class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to_active_hash :prefecture

  has_many :wants, dependent: :destroy
  has_many :entries, dependent: :destroy

  PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "is valid only alphanumeric"

  with_options presence: true do
    validates :nickname
    validates :prefecture_id
    validates :area
    validates :age
    validates :part
    validates :my_hero
  end

end
