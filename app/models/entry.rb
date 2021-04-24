class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :want

  validates :text, presence: true

end
