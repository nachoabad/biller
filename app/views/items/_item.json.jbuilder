json.extract! item, :id, :name, :type, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
