json.array!(@photos) do |photo|
  json.extract! photo, :id, :title, :image_url, :description, :technical_info
  json.url photo_url(photo, format: :json)
end
