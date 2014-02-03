json.array!(@products) do |product|
  json.extract! product, :id, :code, :name, :short_name, :product_group_id
  json.url product_url(product, format: :json)
end
