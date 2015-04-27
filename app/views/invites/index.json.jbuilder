json.array!(@invites) do |invite|
  json.extract! invite, :id, :code, :user_id, :num, :circle_id
  json.url invite_url(invite, format: :json)
end
