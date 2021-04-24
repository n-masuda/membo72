class Want < ApplicationRecord
  belongs_to :user
  has_many :entries

  with_options presence: true do
    validates :title
    validates :text
  end

end
