class Review < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  validates :content, length: { minimum: 3 }

end
