class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :wants, dependent: :destroy
  has_many :entries, dependent: :destroy

  with_options presence: true do
    validates :area
    validates :age
    validates :part
    validates :my_hero
  end

end
