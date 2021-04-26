class Want < ApplicationRecord
  belongs_to :user
  has_many :entries, dependent: :destroy
  has_one_attached :img
  has_one_attached :movie


  with_options presence: true do
    validates :title
    validates :text
  end

end
