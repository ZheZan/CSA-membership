json.array!(@events) do |event|
  json.extract! event, :id, :name, :year, :semester, :category, :description
  json.url event_url(event, format: :json)
end
