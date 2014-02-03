class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :abbr
      t.string :code
      t.string :full_name
      t.string :full_name_kana
      t.string :zipcode
      t.string :pref_name
      t.string :address_city
      t.string :address_extra
      t.string :sales_person_name
      t.string :sales_person_email

      t.timestamps
    end
  end
end
