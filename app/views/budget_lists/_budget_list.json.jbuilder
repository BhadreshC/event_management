json.extract! budget_list, :id, :title, :amount, :created_at, :updated_at
json.url budget_list_url(budget_list, format: :json)
