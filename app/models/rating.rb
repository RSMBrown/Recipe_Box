class Rating < ApplicationRecord
  belongs_to :recipe

  validates :body, presence: true 
end
