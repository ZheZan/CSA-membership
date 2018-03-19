json.array!(@users) do |user|
  json.extract! user, :id, :name, :uin, :tel, :email, :membership, :shirt, :classification, :dynasty
  json.url user_url(user, format: :json)
end
