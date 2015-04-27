json.array!(@feeds) do |feed|
  json.extract! feed, :id, :name, :url, :user_id, :circle_id
  json.url feed_url(feed, format: :json)
end
