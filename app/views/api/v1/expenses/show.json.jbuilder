    json.extract! @expense, :id, :description, :amount
    json.photos @expense.photo.service_url
    json.expense_date @expense.expense_date.strftime("%F")
