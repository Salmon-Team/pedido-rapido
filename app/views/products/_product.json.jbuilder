json.extract! product, :id, :name, :description, :category_id, :price, :preparation_time, :created_at, :updated_at
json.url product_url(product, format: :json)
