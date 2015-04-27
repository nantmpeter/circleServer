json.array!(@circle_users) do |circle_user|
  json.extract! circle_user, :id, :circle_id, :user_id, :invite_user_id
  json.url circle_user_url(circle_user, format: :json)
end
