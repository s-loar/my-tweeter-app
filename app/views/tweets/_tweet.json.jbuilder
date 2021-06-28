json.extract! tweet, :id, :body, :liked_count, :deleted_at, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
