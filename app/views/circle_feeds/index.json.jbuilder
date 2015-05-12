json.array!(@circle_feeds) do |circle_feed|
  json.extract! circle_feed, :id, :circle_id, :feed_id, :user_id
  json.url circle_feed_url(circle_feed, format: :json)
end
