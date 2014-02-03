json.array!(@clients) do |client|
  json.extract! client, :id, :name, :abbr, :code, :full_name, :full_name_kana, :zipcode, :pref_name, :address_city, :address_extra, :sales_person_name, :sales_person_email
  json.url client_url(client, format: :json)
end
