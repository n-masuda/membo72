class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :want

  has_one_attached :movie


  validates :text, presence: true

end
