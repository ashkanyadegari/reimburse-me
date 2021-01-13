class Project < ApplicationRecord
  has_many :project_joins
  has_many :users, through: :project_joins
end
