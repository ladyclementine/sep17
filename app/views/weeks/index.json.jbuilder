json.array!(@weeks) do |week|
  json.extract! week, :id, :name, :subdomain, :description
  json.url week_url(week, format: :json)
end
