json.extract! user, :id, :full_name, :gender, :is_admin, :last_request, :created_at, :updated_at
json.url user_url(user, format: :json)
