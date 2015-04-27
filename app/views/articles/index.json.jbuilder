json.array!(@articles) do |article|
  json.extract! article, :id, :sign, :title, :content, :genre, :user_id, :url, :status
  json.url article_url(article, format: :json)
end
