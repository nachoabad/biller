json.extract! bill, :id, :due_date, :paid_date, :client_id, :created_at, :updated_at
json.url bill_url(bill, format: :json)
