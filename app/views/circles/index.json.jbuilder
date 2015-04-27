json.array!(@circles) do |circle|
  json.extract! circle, :id, :title, :desc, :user_id
  json.url circle_url(circle, format: :json)
end
