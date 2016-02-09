json.array!(@stores) do |store|
  json.extract! store, :id, :filename, :name, :type, :description, :tags, :user_id
  json.url store_url(store, format: :json)
end
