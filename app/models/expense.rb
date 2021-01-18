class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :account, optional: true
  belongs_to :report, optional: true
  belongs_to :user
  belongs_to :project, optional: true
  has_one_attached :photo
end
