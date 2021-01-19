
  json.array! @expenses do |expense|
    json.extract! expense, :id, :description, :amount
    json.category expense.category.description
    json.expense_date expense.expense_date.strftime("%F")
    json.photo expense.photo.service_url
  end
