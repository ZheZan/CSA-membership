json.array!(@dynasties) do |dynasty|
  json.extract! dynasty, :id, :name
  json.url dynasty_url(dynasty, format: :json)
end
