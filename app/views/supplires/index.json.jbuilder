json.array!(@supplires) do |supplire|
  json.extract! supplire, :id, :code, :name, :short_name, :kana, :postal_code, :address1, :address2, :address3, :tel, :fax, :url, :pic_name, :pic_email, :price_ratio, :create_user_id, :update_user_id, :deleted_at
  json.url supplire_url(supplire, format: :json)
end
