json.extract! client, :id, :name, :postal_code, :created_at, :updated_at
json.url client_url(client, format: :json)
