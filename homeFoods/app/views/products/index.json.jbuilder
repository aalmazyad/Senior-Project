json.array!(@products) do |product|
  json.extract! product, :id, :filename, :name, :description, :quantity, :price, :store_id
  json.url product_url(product, format: :json)
end
