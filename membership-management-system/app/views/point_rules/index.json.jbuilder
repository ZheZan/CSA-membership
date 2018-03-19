json.array!(@point_rules) do |point_rule|
  json.extract! point_rule, :id, :name, :score
  json.url point_rule_url(point_rule, format: :json)
end
