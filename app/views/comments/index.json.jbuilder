json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :event_id, :offering_id, :request_id, :body
  json.url comment_url(comment, format: :json)
end
