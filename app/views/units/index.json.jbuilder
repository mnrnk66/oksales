json.array!(@units) do |unit|
  json.extract! unit, :id, :code, :name, :create_user_id, :update_user_id
  json.url unit_url(unit, format: :json)
end
