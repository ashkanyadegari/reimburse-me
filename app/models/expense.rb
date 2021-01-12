class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :account
  belongs_to :report
  belongs_to :user
  belongs_to :project
end
