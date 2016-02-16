json.array!(@stores) do |store|
  json.extract! store, :id, :filename, :name, :contactMethod, :contactId, :foodType, :description, :fromDay, :toDay, :fromHour, :fromZone, :toHour, :toZone, :tags, :address, :city, :state, :zipcode, :country, :user_id
  json.url store_url(store, format: :json)
end
