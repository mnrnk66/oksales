FactoryGirl.define do
  factory :client do
    name "client"
    abbr "c"
    sequence(:code){|n| "code#{n}"}
    full_name "正式名称"
    full_name_kana "セイシキメイショウ"
    zipcode "1000001"
    pref_name "東京都"
    address_city "千代田区"
    address_extra "１−１−１"
    sales_person_name "営業"
    sales_person_email "sales@example.com"
  end
end
