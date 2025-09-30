json.extract! app, :id, :name, :description, :url, :global_login, :global_password, :created_at, :updated_at
json.url app_url(app, format: :json)
