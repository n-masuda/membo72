class Want < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user
  has_many :entries, dependent: :destroy
  has_one_attached :img
  has_one_attached :movie


  with_options presence: true do
    #validates :prefecture_id
    validates :title
    validates :text
  end

end
