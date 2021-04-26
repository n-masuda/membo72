class Entry < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  belongs_to :user
  belongs_to :want

  has_one_attached :movie


  validates :text, presence: true

end
