class Category < ApplicationRecord
  has_many :expenses
  has_one_attached :photo
end
