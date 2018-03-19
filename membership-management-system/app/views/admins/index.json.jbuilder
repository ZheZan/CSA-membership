json.array!(@admins) do |admin|
  json.extract! admin, :id, :name, :uin, :tel, :email
  json.url admin_url(admin, format: :json)
end
