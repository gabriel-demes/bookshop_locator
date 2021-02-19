json.extract! event, :id, :name, :start_time, :user_id, :bookshop_id, :created_at, :updated_at
json.url event_url(event, format: :json)
